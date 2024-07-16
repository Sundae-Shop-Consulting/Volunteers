/**
 * This service allows sending emails.
 */
public with sharing class EmailService {
    /**
     * Send an email.
     */
    public void sendEmail(Email email) {
        // @todo check permissions. validate email?

        /* Can users send emails to recipient ids if they don't have access to those records?
         * Can they use a whatId for a record they don't have access to?
         * What happens if the try to use an OrgWideEmailAddress they don't have access to?
         * Is setting OptOutPolicy to 'FILTER' necessary, or do system settings override this?
         */

        // @todo reserve email capacity

        // @todo send using either list of SingleEmailMessage or MassEmailMessage

        // @todo process and/or return result list

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for (Id targetObjectId : email.targetObjectIds) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTargetObjectId(targetObjectId);
            message.setSubject(email.subject);
            message.setHtmlBody(email.htmlBody);
            message.setWhatId(email.whatId);
            message.setOptOutPolicy('FILTER');
            message.setTreatBodiesAsTemplate(true);

            if (email.orgWideEmailAddressId != null) {
                message.setOrgWideEmailAddressId(email.orgWideEmailAddressId);
            }

            messages.add(message);
        }

        Messaging.sendEmail(messages); // @todo handle result
    }
}
