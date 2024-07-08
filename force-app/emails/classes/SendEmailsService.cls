public with sharing class SendEmailsService {
    @AuraEnabled(cacheable=true)
    public static RecipientInfoList getRecipientInfo(List<Id> targetObjectIds) {
        // verify targets are all same type
        Schema.SObjectType objectType;
        for (Id targetObjectId : targetObjectIds) {
            Schema.SObjectType thisObjectType = targetObjectId.getSObjectType();
            if (objectType == null) {
                objectType = thisObjectType;
            }
            if (objectType != thisObjectType) {
                throw new ServiceException(
                    'All targetObjectIds must be of the same type'
                );
            }
        }

        // dynamically query for names and emails
        String queryTemplate = '' +
            'SELECT ' +
                'Name, ' +
                'Email ' +
            'FROM {0} ' +
            'WHERE Id IN :targetObjectIds ' +
            'WITH USER_MODE ' +
            'ORDER BY Name';

        return new RecipientInfoList(
            objectType,
            Database.query(String.format(
                queryTemplate,
                new List<String>{objectType.getDescribe().getName()}
            ))
        );
    }

    public class RecipientInfoList {
        @AuraEnabled
        public String objectApiName;

        @AuraEnabled
        public List<RecipientInfo> recipients;

        public RecipientInfoList(Schema.SObjectType objectType, List<sObject> recipientObjects) {
            objectApiName = objectType.getDescribe().getName();
            recipients = new List<RecipientInfo>();
            for (sObject recipient : recipientObjects) {
                recipients.add(new RecipientInfo(
                    (Id) recipient.get('Id'),
                    (String) recipient.get('Name'),
                    (String) recipient.get('Email')
                ));
            }
        }
    }

    public class RecipientInfo {
        @AuraEnabled
        public Id id;

        @AuraEnabled
        public String name;

        @AuraEnabled
        public String email;

        public RecipientInfo(Id id, String name, String email) {
            this.id = id;
            this.name = name;
            this.email = email;
        }

        @AuraEnabled
        public String getNameAndEmail() {
            return String.format(
                '"{0}" <{1}>',
                new List<String>{
                    this.name,
                    this.email
                }
            );
        }
    }

    @AuraEnabled
    public static void sendEmail(EmailRequest email) {
        // @todo validation, permissions

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for (Id targetObjectId : email.targetObjectIds) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTargetObjectId(targetObjectId);
            message.setSubject(email.subject);
            message.setHtmlBody(email.htmlBody);
            message.setWhatId(email.whatId);
            message.setOptOutPolicy('FILTER');
            // @todo consider message.setTreatBodiesAsTemplate(true)

            if (email.orgWideEmailAddressId != null) {
                message.setOrgWideEmailAddressId(email.orgWideEmailAddressId);
            }

            messages.add(message);
        }

        Messaging.sendEmail(messages); // @todo handle result
    }

    public class EmailRequest {
        @AuraEnabled
        public Id orgWideEmailAddressId {get; set;}

        @AuraEnabled
        public String subject {get; set;}

        @AuraEnabled
        public String htmlBody {get; set;}

        @AuraEnabled
        public Id whatId {get; set;}

        @AuraEnabled
        public List<Id> targetobjectIds {get; set;}
    }

    @AuraEnabled(cacheable=true)
    public static List<AddressOption> getFromAddressOptions() {
        List<AddressOption> addresses = new List<AddressOption>{
            new AddressOption(
                '',
                UserInfo.getName(),
                UserInfo.getUserEmail()
            )
        };

        List<OrgWideEmailAddress> orgWideAddresses = new List<OrgWideEmailAddress>();

        try {
            orgWideAddresses = getOrgWideEmailAddresses();
        } catch (QueryException e) {
            // if user can't access org wide email addresses, thats ok
        }

        for (OrgWideEmailAddress orgWideAddress : orgWideAddresses) {
            addresses.add(new AddressOption(
                orgWideAddress.Id,
                orgWideAddress.DisplayName,
                orgWideAddress.Address
            ));
        }

        return addresses;
    }

    private static List<OrgWideEmailAddress> getOrgWideEmailAddresses() {
        /* OrgWideEmailAddress records are usable by the current user if:
         * 
         * 1) the org-wide email is verified,
         * 2) the org-wide email is marked for "User Selection"
         * 3) the org-wide email is marked for use by all profiles OR the
         *    current user has access to it via their profile or a permission
         *    set.
         *
         * To determine whether a user has access to an org-wide email via
         * their profile or a permission set, the related entities
         * OrgEmailAddressSecurity or SetupEntityAccess can be used
         * respectively.
         */

        // @todo add try/catch here to ignore any query exceptions

        Set<Id> allowedOrgWideIds = new Set<Id>();

        for (OrgEmailAddressSecurity oeas : [
            SELECT OrgWideEmailAddressId
            FROM OrgEmailAddressSecurity
            WHERE ParentId = :UserInfo.getProfileId()
            WITH USER_MODE
        ]) {
            allowedOrgWideIds.add(oeas.OrgWideEmailAddressId);
        }

        for (SetupEntityAccess sea : [
            SELECT SetupEntityId
            FROM SetupEntityAccess
            WHERE SetupEntityType = 'OrgWideEmailAddress'
            AND ParentId IN (
                SELECT PermissionSetId
                FROM PermissionSetAssignment
                WHERE AssigneeId = :UserInfo.getUserId()
                AND IsActive = true
            )
            WITH USER_MODE
        ]) {
            allowedOrgWideIds.add(sea.SetupEntityId);
        }

        return [
            SELECT
                DisplayName,
                Address
            FROM OrgWideEmailAddress
            WHERE IsVerified = true
            AND Purpose IN (
                'UserSelection',
                'UserSelectionAndDefaultNoReply'
            )
            AND (
                IsAllowAllProfiles = true
                OR Id IN :allowedOrgWideIds
            )
            WITH USER_MODE
            ORDER BY DisplayName
            LIMIT 50
        ];
    }

    public class AddressOption {
        private String displayName;

        private String address;

        @AuraEnabled
        public String value;

        public AddressOption(String value, String displayName, String address) {
            this.value = value;
            this.displayName = displayName;
            this.address = address;
        }

        @AuraEnabled
        public String getLabel() {
            return String.format(
                '{0} <{1}>',
                new List<String>{displayName, address}
            );
        }
    }

    public class ServiceException extends Exception {}
}
