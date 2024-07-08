import { LightningElement, api } from 'lwc';

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
