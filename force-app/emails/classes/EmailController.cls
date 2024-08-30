public with sharing class EmailController {
    /**
     * Get recipient information (i.e. recipient type, name, email address) for
     * the given list of targetObjectIds.
     */
    @AuraEnabled(cacheable=true)
    public static List<EmailRecipient> getRecipientsById(List<Id> targetObjectIds) {
        EmailRecipientService service = new EmailRecipientService();

        List<EmailAddress> emailAddresses = service.getRecipientsById(
            targetObjectIds
        );

        List<EmailRecipient> recipients = new List<EmailRecipient>();

        for (EmailAddress emailAddress : emailAddresses) {
            recipients.add(new EmailRecipient(emailAddress));
        }

        return recipients;
    }

    /**
     * This view model class represents a recipient of an email-- which
     * includes the display name, email address, id of any associated record,
     * and the type of the associated record.  This view model is intended to
     * be used to expose recipient data to email LWC components in a way that
     * is convenient.
     */
    public class EmailRecipient {
        /**
         * This class wraps an EmailAddress instance, which represents the
         * recipient.
         */
        private EmailAddress emailAddress;

        /**
         * Construct an EmailRecipient from an EmailAddress.
         */
        public EmailRecipient(EmailAddress emailAddress) {
            this.emailAddress = emailAddress;
        }

        /**
         * Expose the id of the related record (if any) to front-end
         * components.
         */
        @AuraEnabled
        public String getId() {
            return emailAddress.id;
        }

        /**
         * Expose the display name to front-end components.
         */
        @AuraEnabled
        public String getDisplayName() {
            return emailAddress.displayName;
        }

        /**
         * Expose the email address to front-end components.
         */
        @AuraEnabled
        public String getAddress() {
            return emailAddress.address;
        }

        /**
         * Expose the string name of the type of the related record (if any) to
         * front-end components.
         */
        @AuraEnabled
        public String getSObjectType() {
            return emailAddress
                .getSObjectType()
                ?.getDescribe()
                .getName();
        }
    }

    /**
     * Send an email.
     */
    @AuraEnabled
    public static EmailResults sendEmail(EmailRequest emailRequest) {
        EmailService service = new EmailService();
        return new EmailResults(service.sendEmail(emailRequest.getAsEmail()));
    }

    public class EmailResults {
        private List<Messaging.SendEmailResult> sendEmailResults;

        public EmailResults(List<Messaging.SendEmailResult> sendEmailResults) {
            this.sendEmailResults = sendEmailResults;
        }

        @AuraEnabled
        public Integer getSuccessCount() {
            Integer successCount = 0;

            for (Messaging.SendEmailResult result : sendEmailResults) {
                if (result.isSuccess()) {
                    successCount++;
                }
            }

            return successCount;
        }

        @AuraEnabled
        public Boolean getHasErrors() {
            for (Messaging.SendEmailResult result : sendEmailResults) {
                if (!result.isSuccess()) {
                    return true;
                }
            }

            return false;
        }

        @AuraEnabled
        public Map<Id, String> getErrors() {
            Map<Id, List<String>> errors = new Map<Id, List<String>>();

            for (Messaging.SendEmailResult result : sendEmailResults) {
                for (Messaging.SendEmailError error : result.getErrors()) {
                    Id targetObjectId = error.getTargetObjectId();
                    if (!errors.containsKey(targetObjectId)) {
                        errors.put(targetObjectId, new List<String>());
                    }
                    errors.get(targetObjectId).add(
                        getPublicErrorMessage(error.getStatusCode())
                    );
                }
            }

            Map<Id, String> flatErrors = new Map<Id, String>();

            for (Id targetObjectId : errors.keySet()) {
                flatErrors.put(
                    targetObjectId,
                    String.join(errors.get(targetObjectId), ' ')
                );
            }

            return flatErrors;
        }

        private String getPublicErrorMessage(System.StatusCode statusCode) {
            switch on statusCode {
                when INSUFFICIENT_ACCESS_ON_CROSS_REFERENCE_ENTITY {
                    return Label.errorEmailInvalidRecipient;
                }
                when INVALID_EMAIL_ADDRESS {
                    return Label.errorEmailInvalidAddress;
                }
                when INSUFFICIENT_ACCESS_OR_READONLY {
                    return Label.errorEmailInsufficientAccess;
                }
                when EMAIL_OPTED_OUT {
                    return Label.errorEmailRecipientOptOut;
                }
                when else {
                    return Label.errorEmailUnableToSend;
                }
            }
        }
    }

    /**
     * This view model class represents the details of an email to be sent,
     * including originator and recipient information, and content information
     * like subject and HTML message body.
     */
    public class EmailRequest {
        /**
         * The id of the OrgWideEmailAddress to be used when sending the email
         * (if any).
         */
        @AuraEnabled
        public Id orgWideEmailAddressId {get; set;}

        /**
         * The subject of the email.
         */
        @AuraEnabled
        public String subject {get; set;}

        /**
         * The HTML body of the email.
         */
        @AuraEnabled
        public String htmlBody {get; set;}

        /**
         * The id of a related record the email should be related to (if any).
         * This is used when processing template placeholders and when creating
         * activities.
         */
        @AuraEnabled
        public Id whatId {get; set;}

        /**
         * A list of ids of records which represent the recipients of messages.
         * These need to correspond to supported object types which can be used
         * as recipients.
         */
        @AuraEnabled
        public List<Id> targetobjectIds {get; set;}

        /**
         * Get this request object as an Email instance.
         */
        public Email getAsEmail() {
            Email email = new Email();
            email.orgWideEmailAddressId = orgWideEmailAddressId;
            email.subject = subject;
            email.htmlBody = htmlBody;
            email.whatId = whatId;
            email.targetObjectIds = targetObjectIds;
            return email;
        }
    }

    /**
     * Get a list of email address options that a user can choose from when
     * sending an email.  This includes the user's own email address as well as
     * any verified, enabled for user selection org-wide email addresses.
     *
     * If the user's own email address is not valid for sending (i.e. it is not
     * verified) then it will not be included as a "From" address option.
     *
     * If the org-wide email addresses can not be retrieved for any reason
     * (likely relevant objects are not accessible to the current user) then
     * org-wide email addresses are silently omitted from the returned list and
     * no exception is thrown.
     *
     * In the case where there are no verified/available org wide email
     * addresses and the user's own email address is not verified (i.e. not
     * valid for sending emails), then the returned list of options can be
     * empty.
     */
    @AuraEnabled(cacheable=true)
    public static List<AddressOption> getFromAddressOptions() {
        EmailAddressService service = new EmailAddressService();

        List<AddressOption> addresses = new List<AddressOption>();

        EmailAddress currentEmail = service.getCurrentUserEmailAddress();

        if (currentEmail.isVerified) {
            addresses.add(new AddressOption(currentEmail));
        }

        try {
            for (EmailAddress orgWideAddress : service.getOrgWideEmailAddresses()) {
                addresses.add(new AddressOption(orgWideAddress));
            }
        } catch (EmailAddressService.ServiceException e) {
            // if user can't access org wide email addresses, thats ok-- we
            // just won't include any in the options list
        }

        return addresses;
    }

    /**
     * This class represents selectable email address option a user can choose
     * from when sending an email.
     */
    public class AddressOption {
        /**
         * The EmailAddress this option corresponds to.
         */
        private EmailAddress address;

        /**
         * Construct an AddressOption from an EmailAddress.
         */
        public AddressOption(EmailAddress address) {
            this.address = address;
        }

        /**
         * Get the option value for this AddressOption, which for org-wide
         * email addresses will be the record id of the OrgWideEmailAddress
         * record, and for user's own email address will be their user id.
         */
        @AuraEnabled
        public String getValue() {
            return address.id;
        }

        /**
         * Get the label for this AddressOption, which should be the individual
         * mailbox name for the email address (i.e. a formatted string which
         * includes the email address's display name and email address).
         */
        @AuraEnabled
        public String getLabel() {
            return address.getNameAndAddress();
        }
    }

    /**
     * Exception class indicating something went wrong within this controller.
     */
    public class ControllerException extends Exception {}
}