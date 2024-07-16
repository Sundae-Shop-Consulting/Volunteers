import { LightningElement, api } from 'lwc';
import LightningModal from 'lightning/modal';
import recipientsModal from './recipientsModal.html';

export default class SendEmailsForm extends LightningElement {
    @api
    fromAddressOptions = [];

    @api
    whatId;

    @api
    whatIconUrl;

    @api
    relatedTo;

    _recipients;

    @api
    recipients;

    get hasRelatedToName() {
        return !!this.relatedTo?.name;
    }

    get hasRecipients() {
        return Array.isArray(this.recipients) && this.recipients.length > 0;
    }

    get hasTooManyRecipients() {
        return this.hasRecipients && this.recipients.length > 10;
    }

    get tooManyRecipientsLabel() {
        console.log('in tooManyRecipientsLabel');
        return `${this.recipients.length} Recipients`;
    }

    iconMap = new Map([
        ["Contact", "standard:contact"],
        ["User", "standard:user"],
        ["Lead", "standard:lead"],
    ]);

    get recipientPills() {
        return this.recipients.map((recipient) => ({
            ...recipient,
            iconName: this.iconMap.get(recipient.sObjectType) || "standard:email_chatter"
        }));
    }

    orgWideEmailAddressId = '';
    subject = '';
    htmlBody = '';

    // specifying formats so that image insertion can be explicitly removed.
    // this also adds color selection and the ability to paste additional
    // formats, for good measure.
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
        'image', // @debug testing
    ];

    showRecipientsModal(event) {
        RecipientsModal.open({
            size: 'small',
            recipients: this.recipients,
        });
    }

    handleFromChange(event) {
        this.orgWideEmailAddressId = event.target.value;
    }

    handleSubjectChange(event) {
        this.subject = event.target.value;
    }

    handleMessageChange(event) {
        this.htmlBody = event.target.value;
    }

    handleClickSend() {
        // @todo form validation

        this.dispatchEvent(new CustomEvent(
            "sendemail",
            {
                detail: {
                    orgWideEmailAddressId: this.orgWideEmailAddressId,
                    subject: this.subject,
                    htmlBody: this.htmlBody
                }
            }
        ));
    }
}

class RecipientsModal extends LightningModal {
    @api
    recipients;

    columns = [
        {
            label: "Recipient Name",
            fieldName: "displayName",
            type: "text"
        },
        {
            label: "Email",
            fieldName: "address",
            type: "email"
        },
    ];

    render() {
        return recipientsModal;
    }
}

