/**
 * This class represents an email to be sent, including originator, recipient,
 * subject, and body information.
 */
public class Email {
    /**
     * The id of the OrgWideEmailAddress to be used when sending the email (if any).
     */
    public Id orgWideEmailAddressId;

    /**
     * The subject of the email.
     */
    public String subject;

    /**
     * The HTML body of the email.
     */
    public String htmlBody;

    /**
     * The id of a related record the email should be related to (if any). This
     * is used when processing template placeholders and when creating
     * activities.
     */
    public Id whatId;

    /**
     * A list of ids of records which represent the recipients of messages.
     * These need to correspond to supported object types which can be used as
     * recipients.
     */
    public List<Id> targetobjectIds;

    /**
     * Does this email have an org wide email address id specified?
     *
     * Note this means that not only is an id value specified for the org-wide
     * email address id, but the id is of the proper type.
     */
    public Boolean hasOrgWideEmailAddressId() {
        return (
            this.orgWideEmailAddressId != null
            && this.orgWideEmailAddressId.getSObjectType() == OrgWideEmailAddress.sObjectType
        );
    }
}
