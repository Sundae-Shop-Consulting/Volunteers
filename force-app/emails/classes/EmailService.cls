/**
 * This service allows sending emails.
 */
public with sharing class EmailService {
    /**
     * Send an email.
     */
    public List<Messaging.SendEmailResult> sendEmail(Email email) {
        // When running in a 'with sharing' context, while sending
        // SingleEmailMessage emails, the platform Messaging.sendEmail() method
        // will enforce record level access for recipients (identified by
        // targetObjectId), related records (whatId), and org-wide email
        // addresses (if any are used).  A user needs to be able to read the
        // records used as recipients or related records, or be authorized to
        // use the org-wide email address, otherwise the email will fail to
        // send.  This is good and we like this.
        //
        // However, the sendEmail message will not enforce certain other
        // permissions, like whether the user has the "Send Email" permission
        // assigned to them.  So, we will check that permission ourselves
        // before allowing the sendEmail() method to be called by the running
        // user.

        UserPermissionAccess upa = [
            SELECT
                PermissionsEmailSingle
            FROM UserPermissionAccess
            LIMIT 1
        ];

        if (!upa.PermissionsEmailSingle) {
            throw new NotPermittedException(
                '"Send Email" permission is required to send email.'
            );
        }

        try {
            Messaging.reserveSingleEmailCapacity(email.targetObjectIds.size());
        } catch (HandledException he) {
            throw new EmailLimitException(
                String.format(
                    'Sending {0} emails would exceed the available daily ' +
                    'email limit.',
                    new List<String>{
                        String.valueOf(email.targetObjectIds.size())
                    }
                )
            );
        } catch (NoAccessException nae) {
            throw new NotPermittedException(
                'This organization is not permitted to send email.'
            );
        }

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for (Id targetObjectId : email.targetObjectIds) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTargetObjectId(targetObjectId);
            message.setSubject(email.subject);
            message.setHtmlBody(email.htmlBody);
            message.setWhatId(email.whatId);
            message.setOptOutPolicy('FILTER'); // @todo
            message.setTreatBodiesAsTemplate(true);

            if (email.orgWideEmailAddressId != null) {
                message.setOrgWideEmailAddressId(email.orgWideEmailAddressId);
            }

            messages.add(message);
        }

        return Messaging.sendEmail(messages, false);
    }

    public virtual class ServiceException extends Exception {}
    public class NotPermittedException extends ServiceException {}
    public class EmailLimitException extends ServiceException {}
}
