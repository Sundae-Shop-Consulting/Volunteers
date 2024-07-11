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

    @api
    recipientInfo;

    get hasRelatedToName() {
        return !!this.relatedTo?.name;
    }

    get hasRecipients() {
        return Array.isArray(this.recipientInfo?.recipients) && this.recipientInfo.recipients.length > 0;
    }

    get recipientPills() {
        // if there are more than a certain number of recipients, we just show
        // one single pill with the number of recipients.  Otherwise, we show a
        // pill for each recipient.  This is to accommodate scenarios where
        // dozens or hundreds of recipients are provided.
        if (this.hasRecipients) {
            if (this.recipientInfo.recipients.length > 10) {
                return [
                    {
                        id: "too-many-recipients-pill",
                        name: `${this.recipientInfo.recipients.length} recipients`,
                        colorStyle: this.recipientInfo.colorStyle,
                        iconUrl: this.recipientInfo.iconUrl,
                    }
                ];
            } else {
                return this.recipientInfo.recipients.map((recipient) => (
                    {
                        ...recipient,
                        colorStyle: this.recipientInfo.colorStyle,
                        iconUrl: this.recipientInfo.iconUrl,
                    }
                ));
            }
        } else {
            return [];
        }
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
    ];

    showRecipientsModal(event) {
        RecipientsModal.open({
            size: 'small',
            recipientInfo: this.recipientInfo,
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

        // @todo close modal
    }
}

class RecipientsModal extends LightningModal {
    @api
    recipientInfo;

    columns = [
        {
            label: "Recipient Name",
            fieldName: "name",
            type: "text"
        },
        {
            label: "Email",
            fieldName: "email",
            type: "email"
        },
    ];

    get recipients() {
        return this.recipientInfo?.recipients || [];
    }

    render() {
        return recipientsModal;
    }
}

