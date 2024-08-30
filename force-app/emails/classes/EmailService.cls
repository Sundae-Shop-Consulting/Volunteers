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
                PermissionsEmailSingle, // "Send Email"
                PermissionsTransactionalEmailSend // "Send Non-Commercial Email"
            FROM UserPermissionAccess
            LIMIT 1
        ];

        if (!upa.PermissionsEmailSingle) {
            throw new NotPermittedException(Label.errorEmailUserNotPermitted);
        }

        try {
            Messaging.reserveSingleEmailCapacity(email.targetObjectIds.size());
        } catch (HandledException he) {
            throw new EmailLimitException(
                String.format(
                    Label.errorEmailInsufficientLimit,
                    new List<String>{
                        String.valueOf(email.targetObjectIds.size())
                    }
                )
            );
        } catch (NoAccessException nae) {
            throw new NotPermittedException(Label.errorEmailOrgNotPermitted);
        }

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for (Id targetObjectId : email.targetObjectIds) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setTargetObjectId(targetObjectId);
            message.setSubject(email.subject);
            message.setHtmlBody(email.htmlBody);
            message.setWhatId(email.whatId);
            message.setTreatBodiesAsTemplate(true);

            if (email.hasOrgWideEmailAddressId()) {
                message.setOrgWideEmailAddressId(email.orgWideEmailAddressId);
            }

            if (upa.PermissionsTransactionalEmailSend) {
                // If the current running user has the "Send Non-Commercial
                // Email" permission, then we allow all emails to be sent
                // regardless of whether the recipient has opt-out preferences
                // set.
                //
                // Ideally this opt-out policy would be controllable by the
                // current running user (if they have the necessary
                // permission), but for now we simply disable opt-out filtering
                // if they have the relevant permission because otherwise they
                // would be blocked by the opt-out policy altogether, even in
                // cases where they should legitimately be allowed to send
                // email to recipients.
                message.setOptOutPolicy('SEND');
            } else {
                message.setOptOutPolicy('FILTER');
            }

            messages.add(message);
        }

        return Messaging.sendEmail(messages, false);
    }

    public virtual class ServiceException extends Exception {}
    public class NotPermittedException extends ServiceException {}
    public class EmailLimitException extends ServiceException {}
}
