/**
 * This service class provides methods for getting information about
 * recipients while sending an email.
 */
public with sharing class EmailRecipientService {
    /**
     * Get a list of recipient EmailAddress records for a given list of
     * recipient ids.  If a record isn't accessible for a given recipientId, or
     * if the recipient is not a "supported" type, we simply don't return it.
     *
     * Supported recipient types include: Contact, Lead, and User.
     *
     * @param recipientIds A list of ids of valid recipient records-- i.e.,
     * the types of objects that can be used as a "target object id" when
     * sending an email message using Apex.
     */
    public List<EmailAddress> getRecipientsById(List<Id> recipientIds) {
        // we only support the following object types as recipients:
        Set<Schema.SObjectType> allowedTypes = new Set<Schema.SObjectType>{
            Contact.sObjectType,
            Lead.sObjectType,
            User.sObjectType
        };

        Set<Schema.SObjectType> recipientTypes = new Set<Schema.SObjectType>();

        for (Id recipientId : recipientIds) {
            recipientTypes.add(recipientId.getSObjectType());
        }

        List<EmailAddress> emailRecipients = new List<EmailAddress>();

        String queryTemplate = '' +
            'SELECT ' +
                'Name, ' +
                'Email ' +
            'FROM {0} ' +
            'WHERE Id IN :recipientIds ' +
            'ORDER BY Name';

        for (Schema.SObjectType sot : recipientTypes) {
            if (!allowedTypes.contains(sot) || !sot.getDescribe().isAccessible()) {
                continue;
            }

            String query = String.format(
                queryTemplate,
                new List<String>{sot.getDescribe().getName()}
            );

            List<SObject> recipientRecords = Security.stripInaccessible(
                AccessType.READABLE,
                Database.query(query)
            ).getRecords();

            for (SObject recipientRecord : recipientRecords) {
                emailRecipients.add(new EmailAddress(recipientRecord));
            }
        }

        return emailRecipients;
    }
}
