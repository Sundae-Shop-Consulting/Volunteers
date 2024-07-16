/**
 * This service class provides methods for getting information about
 * recipients while sending an email.
 */
public with sharing class EmailRecipientService {
    // we only support the following object types as recipients:
    private static Set<Schema.SObjectType> allowedTypes = new Set<Schema.SObjectType>{
        Contact.sObjectType,
        Lead.sObjectType,
        User.sObjectType
    };

    /**
     * Return the types of the recipient ids (i.e., what type of record each id
     * corresponds to).
     *
     * @throws ServiceException if any of the given ids correspond to an
     * unsupported recipient type.
     */
    private Set<Schema.SObjectType> getRecipientTypes(List<Id> recipientIds) {
        Set<Schema.SObjectType> recipientTypes = new Set<Schema.SObjectType>();

        for (Id recipientId : recipientIds) {
            recipientTypes.add(recipientId.getSObjectType());
        }

        if (!allowedTypes.containsAll(recipientTypes)) {
            throw new ServiceException(
                'Only some types of records are allowed to be used as ' +
                'recipients.'
            );
        }

        return recipientTypes;
    }

    /**
     * Get a list of recipient EmailAddress records for a given list of
     * recipient ids.
     *
     * @param recipientIds A list of ids of valid recipient records-- i.e.,
     * the types of objects that can be used as a "target object id" when
     * sending an email message using Apex.
     *
     * @throws ServiceException if any of the record ids provided do not
     * correspond to a "supported" type, or if there are any issues querying
     * for the recipient information (likely due to CRUD or FLS security
     * issues).
     */
    public List<EmailAddress> getRecipientsById(List<Id> recipientIds) {
        Set<Schema.SObjectType> recipientTypes = getRecipientTypes(
            recipientIds
        );

        List<EmailAddress> emailRecipients = new List<EmailAddress>();

        String queryTemplate = '' +
            'SELECT ' +
                'Name, ' +
                'Email ' +
            'FROM {0} ' +
            'WHERE Id IN :recipientIds ' +
            'WITH USER_MODE ' +
            'ORDER BY Name';

        for (Schema.SObjectType sot : recipientTypes) {
            String query = String.format(
                queryTemplate,
                new List<String>{sot.getDescribe().getName()}
            );

            try {
                for (SObject recipientRecord : Database.query(query)) {
                    emailRecipients.add(new EmailAddress(recipientRecord));
                }
            } catch (QueryException e) {
                throw new ServiceException(
                    'User could not retrieve records for recipients.  Please ' +
                    'review your security configuration.',
                    e
                );
            }
        }

        return emailRecipients;
    }

    /**
     * Exception class indicating something went wrong within this service.
     */
    public class ServiceException extends Exception {}

    // @todo more specific types of exceptions to allow callers to
    // distinguish between supported type exceptions and query exceptions.
}
