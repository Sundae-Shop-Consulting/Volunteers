/**
 * This class represents an email address, along with additional information
 * such as the display name for the email mailbox and, if the email address is
 * associated with a Salesforce reocrd, the id of the associated record.
 */
public class EmailAddress {
    /**
     * The id of the record associated with the email address (or null if there
     * is no associated record), such as a Salesforce User, Contact, Lead, or
     * OrgWideEmailAddress.
     */
    public Id id;

    /**
     * The display name for the email mailbox, e.g., the recipients full name
     * or some other display name.
     */
    public String displayName;

    /**
     * The actual email address, which is presumably a properly addr-spec
     * formatted email address.  This class does no validation of email
     * addresses (even "allowing" empty and null values to be used).
     */
    public String address;

    /**
     * Construct an EmailAddress given a record id, display name, and a
     * formatted email address.
     */
    public EmailAddress(Id id, String displayName, String address) {
        this.id = id;
        this.displayName = displayName;
        this.address = address;
    }

    /**
     * Construct an EmailAddress given an OrgWideEmailAddress, from which the
     * `Id`, `DisplayName`, and `Address` fields will be used.
     */
    public EmailAddress(OrgWideEmailAddress orgWideEmailAddress) {
        this(
            orgWideEmailAddress.Id,
            orgWideEmailAddress.DisplayName,
            orgWideEmailAddress.Address
        );
    }

    /**
     * Construct an EmailAddress from a User, Lead, or Contact record, from
     * which the `Id`, `Name`, and `Email` fields will be used.
     */
    public EmailAddress(SObject record) {
        id = (Id) record.get('Id');
        displayName = (String) record.get('Name');

        try {
            address = (String) record.get('Email');
        } catch (SObjectException e) {
            // Email field is not on the object, which *probably* means it was
            // removed from the object because the user doesn't have access to
            // that field.  This is ok-- address remains null in this case, and
            // it can be handled by consumers of this instance.
        }
    }

    /**
     * Return a string formatted as an individual mailbox address, which
     * includes the display name and the email address in brackets.  For
     * example: "Ava Smith <asmith@example.com>"
     */
    public String getNameAndAddress() {
        List<String> parts = new List<String>();

        if (!String.isBlank(displayName)) {
            parts.add(displayName);
        }

        if (!String.isBlank(address)) {
            parts.add('<' + address + '>');
        }

        return String.join(parts, ' ');
    }

    /**
     * Return the SObjectType of the record this EmailAddress is associated
     * with (or null if no associated record).
     */
    public Schema.SObjectType getSObjectType() {
        return id?.getSObjectType();
    }
}
