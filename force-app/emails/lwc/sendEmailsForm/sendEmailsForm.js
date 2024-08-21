import { LightningElement, api } from 'lwc';
import LightningModal from 'lightning/modal';
import recipientsModal from './recipientsModal.html';

import emailRecipientNameLabel from '@salesforce/label/c.emailRecipientNameLabel';
import emailEmailLabel from '@salesforce/label/c.emailEmailLabel';
import emailRecipientsLabel from '@salesforce/label/c.emailRecipientsLabel';
import emailRecipientCountLabel from '@salesforce/label/c.emailRecipientCountLabel';
import emailRecipientsRemoved from '@salesforce/label/c.emailRecipientsRemoved';
import emailRecipientsInvalid from '@salesforce/label/c.emailRecipientsInvalid';
import emailErrorInputRequired from '@salesforce/label/c.emailErrorInputRequired';
import emailSendButton from '@salesforce/label/c.emailSendButton';
import emailFromLabel from '@salesforce/label/c.emailFromLabel';
import emailToLabel from '@salesforce/label/c.emailToLabel';
import emailViewRecipients from '@salesforce/label/c.emailViewRecipients';
import emailSubjectLabel from '@salesforce/label/c.emailSubjectLabel';
import emailEnterSubject from '@salesforce/label/c.emailEnterSubject';
import emailMessageLabel from '@salesforce/label/c.emailMessageLabel';
import emailRelatedToLabel from '@salesforce/label/c.emailRelatedToLabel';

/**
 * This component is a UI component, intended to display and manage a form
 * which a user can fill out with details of the email to be sent.  This
 * component relies on a parent component to provide relevant values (like
 * anything queried from the server) and delegates to the parent component to
 * provide non-UI level functionality, like actual sending of emails.
 */
export default class SendEmailsForm extends LightningElement {
    label = {
        emailRecipientsLabel,
        emailSendButton,
        emailFromLabel,
        emailToLabel,
        emailViewRecipients,
        emailSubjectLabel,
        emailEnterSubject,
        emailMessageLabel,
        emailRelatedToLabel,
    };

    @api
    hasEmailFieldAccess = false;

    // *** originator ***

    /**
     * A list of originator options to be used to populate the "From" form
     * element. This matches the format expected by lightning-select options.
     *
     * Some strange assumptions are included here, like that the list includes
     * an option with a blank value which acts as the default (see
     * orgWideEmailAddressId below).  In this case, the user's own email
     * address is considered the default and only if they select an option from
     * this list would they be overriding that choice by selecting an org-wide
     * email address.
     */
    @api
    fromAddressOptions = [];

    /**
     * The org-wide email address to use as originator, if any.
     */
    orgWideEmailAddressId = '';

    /**
     * Set the org-wide email address to be used based on the value selected in
     * the "From" form element.
     */
    handleFromChange(event) {
        this.orgWideEmailAddressId = event.target.value;
    }


    // *** recipients ***

    /**
     * List of recipients, including details like id, displayName, address,
     * type, etc.
     */
    @api
    recipients;

    /**
     * If the recipients are specified by id, but for some reason some of the
     * records corresponding to those ids either do not exist or are not
     * accessible by the current user then no recipient will be shown for that
     * record id.  This property is set by the parent component if any such
     * filtering of "default" recipients has occurred.  This is useful for
     * informing the user that they may not be seeing all the recipients they
     * might have been expecting to see.
     */
    @api isRecipientsFiltered;

    /**
     * Is there at least one recipient in the recipient list?
     */
    get hasRecipients() {
        return Array.isArray(this.recipients) && this.recipients.length > 0;
    }

    /**
     * Are there too many recipients in the recipient list?  This is useful to
     * know whether we can display the full list of recipients in the pill
     * container or not.
     */
    get hasTooManyRecipients() {
        return this.hasRecipients && this.recipients.length > 10;
    }

    /**
     * Get a label which can be shown to users in place of showing a huge list
     * of recipients.
     */
    get tooManyRecipientsLabel() {
        return emailRecipientCountLabel.replaceAll(
            '{0}',
            this.recipients.length
        );
    }

    /**
     * Map the supported recipient record types to a lightning icon name.
     */
    iconMap = new Map([
        ["Contact", "standard:contact"],
        ["User", "standard:user"],
        ["Lead", "standard:lead"],
    ]);

    /**
     * Given a recipient type, return a corresponding lightning icon name.
     */
    getRecipientIcon(type) {
        return this.iconMap.get(type) || "standard:email_chatter";
    }

    /**
     * Get a list of recipients appropriate for displaying as pills in a pill
     * container.
     */
    get recipientPills() {
        return this.recipients.map((recipient) => ({
            ...recipient,
            iconName: this.getRecipientIcon(recipient.sObjectType)
        }));
    }

    /**
     * Allow validity of recipients to be conditionally displayed, so that we
     * can match behavior of native lightning-input elements where a missing
     * value is not indicated until after the user interacts with the element.
     * For now, though, since recipients is read only in the email form we show
     * the validity always.
     */
    isRecipientsValidityVisible = true;

    /**
     * Is the list of recipients invalid and should that be shown to the user?
     */
    get isRecipientsVisiblyInvalid() {
        return this.isRecipientsValidityVisible && !this.isRecipientsValid;
    }

    /**
     * Is the list of recipients valid?
     */
    get isRecipientsValid() {
        return this.hasRecipients;
    }

    /**
     * Are there any recipients which have a blank email address (ignoring
     * cases where we don't know their email address because of FLS)?
     */
    get isRecipientsInvalidEmail() {
        return this.hasRecipients && this.hasEmailFieldAccess && this.recipients.some(
            recipient => 
                !Object.hasOwn(recipient, 'address')
                || recipient.address == ''
        );
    }

    /**
     * Return a status which corresponds to the validity status of the
     * recipient list.  Some issues with the list count as errors, some issues
     * are not as severe and only count as warnings.
     */
    get recipientValidityStatus() {
        if (!this.hasRecipients) {
            return 'error';
        }

        if (this.isRecipientsFiltered || this.isRecipientsInvalidEmail) {
            return 'warning';
        }

        return '';
    }

    /**
     * Get a class string which can be applied to the recipient list form
     * element.
     */
    get recipientsFormElementClass() {
        const classes = [
            'slds-form-element',
            'slds-form-element__readonly'
        ];

        this.addRecipientValidityClasses(classes);

        return classes.join(' ');
    }

    /**
     * Get a class string which can be applied to the recipient pill container
     * element.
     */
    get recipientsPillContainerClass() {
        const classes = [
            'slds-pill_container',
            'recipient-pill-container'
        ];

        this.addRecipientValidityClasses(classes);

        return classes.join(' ');
    }

    /**
     * When building class strings, this utility method will add in any special
     * class names which can be used to indicate validity status.
     */
    addRecipientValidityClasses(classes) {
        const validityStatus = this.recipientValidityStatus;

        if (validityStatus == 'error') {
            classes.push('slds-has-error');
        } else if (validityStatus == 'warning') {
            classes.push('has-warning');
        }
    }

    /**
     * Get a string which can be displayed as the recipient list form element
     * help message.
     */
    get recipientsHelpMessage() {
        const messages = [];

        if (this.isRecipientsFiltered) {
            messages.push(emailRecipientsRemoved);
        }

        if (Array.isArray(this.recipients) && this.recipients.length == 0) {
            messages.push(emailRecipientsRequired);
        }

        if (this.isRecipientsInvalidEmail) {
            messages.push(emailRecipientsInvalid);
        }

        return messages.join('  ');
    }

    /**
     * Show the recipient details modal
     */
    showRecipientsModal(event) {
        RecipientsModal.open({
            size: 'small',
            recipients: this.recipients,
            hasEmailFieldAccess: this.hasEmailFieldAccess,
        });
    }


    // *** subject ***

    /**
     * The subject line of the email.
     */
    subject = '';

    /**
     * Update the email subject based on the value entered in the "Subject" form element
     */
    handleSubjectChange(event) {
        this.subject = event.target.value;
    }

    /**
     * Is the current email subject considered valid?
     */
    get isSubjectValid() {
        return !!this.subject;
    }


    // *** body ***

    /**
     * The HTML markup used for the body of the email.
     */
    htmlBody = '';

    /**
     * The formats allowed in the rich text editor for the email body.  Note
     * that the default rich text options are being overridden specifically to
     * remove the ability to add images to the markup, since this is not
     * supported at this time.  We also add some non-default formatting options
     * like the ability to choose colors and paste some formatted text.
    */
    richTextAllowedFormats = [
        'font',
        'size',
        'bold',
        'italic',
        'underline',
        'strike',
        'list',
        'indent',
        'align',
        'link',
        'clean',
        'header',
        'color',
        'code',
        'code-block',
        'script',
        'blockquote',
    ];

    /**
     * The error message to show in the "Message" form element.
     */
    bodyErrorMessage = '';

    /**
     * Should the validity of the "Message" form element be shown to users?
     *
     * The lightning-input-rich-text component doesn't handle validation itself
     * like lightning-input does, but it will show validity and error messages
     * if we provide them.  We're setting things up here so
     * lightning-input-rich-text acts very similar to lightning-input in that
     * validity is only shown after the user first touches the field.  This is
     * important because the field starts out invalid, because it has no
     * default value and must be populated before being considered valid, and
     * we want to avoid showing an error message to the user when they haven't
     * done anything in the form yet.
     *
     */
    isBodyValidityVisible = false;

    /**
     * Update the email body with the markup from the "Message" form element.
     */
    handleBodyChange(event) {
        this.htmlBody = event.target.value;
        this.isBodyValidityVisible = true;
    }

    /**
     * When the user navigates away from the "Message" form element, even if
     * they didn't change anything, we consider it now ok to show validity
     * messages.  This more closely matches the behavior of standard
     * lightning-input elements.
     */
    handleBodyBlur(event) {
        this.isBodyValidityVisible = true;
    }

    /**
     * Is the body of the email considered valid?
     *
     * This also sets (or clears) the error message for the "Message" element
     * if the body is considered invalid (or valid).
     */
    get isBodyValid() {
        if (!this.htmlBody) {
            this.bodyErrorMessage = emailErrorInputRequired;
            return false;
        } else {
            this.bodyErrorMessage = '';
            return true;
        }
    }

    /**
     * Is the "Message" form element valid and should we indicate to the user
     * if it isn't?
     */
    get isBodyVisiblyValid() {
        return !this.isBodyValidityVisible || this.isBodyValid;
    }


    // *** related record ***

    /**
     * The related record, if any.  This includes details like the name of the
     * related record and other display information like icon and color.
     */
    @api
    relatedTo;

    /**
     * Does the relatedTo object have icon/color display information?
     */
    get hasRelatedToIcon() {
        return !!this.relatedTo?.color && !!this.relatedTo?.iconUrl
    }

    /**
     * Get the inline style to use when displaying the icon for the relatedTo
     * object.  This is used to control the background color of the icon being
     * displayed.
     */
    get relatedToIconStyle() {
        if (this.hasRelatedToIcon) {
            return `background-color: #${this.relatedTo.color}`;
        }
    }

    /**
     * Does the relatedTo object have a record name set?
     */
    get hasRelatedToName() {
        return !!this.relatedTo?.name;
    }


    // *** send button ***

    /**
     * Is the form considered valid?  This is true if the critical elements of
     * the form are considered valid.
     */
    get isFormValid() {
        return this.isRecipientsValid
            && this.isSubjectValid
            && this.isBodyValid;
    }

    /**
     * Should the "Send" button be disabled?
     */
    get isSendDisabled() {
        return !this.isFormValid
    }

    /**
     * The user clicked the "Send" button, so if the form is valid we should
     * indicate to the parent component that the email should be sent using the
     * email values from this form.
     */
    handleClickSend() {
        if (!this.isFormValid) {
            return;
        }

        this.dispatchEvent(new CustomEvent(
            "sendemail",
            {
                detail: {
                    orgWideEmailAddressId: this.orgWideEmailAddressId,
                    subject: this.subject,
                    htmlBody: this.htmlBody,
                }
            }
        ));
    }
}

/**
 * This modal can be displayed to show the full list of recipients along with
 * additional details.
 */
class RecipientsModal extends LightningModal {
    modalLabel = {
        emailRecipientsLabel,
    };

    /**
     * The list of recipients-- same as what is used in the parent component.
     */
    @api
    recipients;

    /**
     * Does the current user have read access to the Contact.Email field?
     */
    @api
    hasEmailFieldAccess;

    /**
     * Which columns should be displayed in the table in the modal?  This will
     * exclude the 'Email' column if the user is inferred to not have access to
     * that field.
     */
    get columns() {
        const columns = [
            {
                label: emailRecipientNameLabel,
                fieldName: "displayName",
                type: "text"
            },
        ];

        if (this.hasEmailFieldAccess) {
            columns.push(
                {
                    label: emailEmailLabel,
                    fieldName: "address",
                    type: "email"
                }
            );
        }

        return columns;
    }

    /**
     * Override the render method to return the template for the modal.
     */
    render() {
        return recipientsModal;
    }
}
