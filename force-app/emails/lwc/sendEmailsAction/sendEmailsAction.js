import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getFromAddressOptions from '@salesforce/apex/EmailController.getFromAddressOptions';
import getRecipientsById from '@salesforce/apex/EmailController.getRecipientsById';
import sendEmail from '@salesforce/apex/EmailController.sendEmail';

export default class SendEmailsAction extends LightningElement {
    @api
    whatId;

    @api
    whatObjectApiName;

    get whatObjectNameField() {
        return `${this.whatObjectApiName}.Name`;
    }

    get whatObjectFields() {
        return [this.whatObjectNameField];
    }

    relatedTo = {};

    @wire(getRecord, {recordId: "$whatId", fields: "$whatObjectFields"})
    wiredGetWhatRecord(record) {
        if (record.data) {
            this.relatedTo.name = getFieldValue(record.data, this.whatObjectNameField);
        }
        // @todo handle errors?
    }

    @wire(getObjectInfo, {objectApiName: "$whatObjectApiName"})
    wiredGetObjectInfo(objectInfo) {
        if (objectInfo.data) {
            this.relatedTo.iconUrl = objectInfo.data?.themeInfo.iconUrl;
            this.relatedTo.color = objectInfo.data?.themeInfo.color;
            this.relatedTo.colorStyle = `background-color: #${this.relatedTo.color}`;
        }
        // @todo handle errors?
    }

    @api
    targetObjectIds;

    recipients;

    @wire(getRecipientsById, {targetObjectIds: "$targetObjectIds"})
    wiredRecipientInfo(recipients) {
        if (recipients.data) {
            this.recipients = recipients.data;
        }
        // @todo handle errors
    }

    fromAddressOptions = [];

    @wire(getFromAddressOptions)
    wiredFromAddressOptions(result) {
        if (result.data) {
            this.fromAddressOptions = result.data;
        }
        // @todo error handling
    }

    handleSendEmail(event) {
        // @todo validation

        const emailRequest = {
            subject: event?.detail?.subject,
            htmlBody: event?.detail?.htmlBody,
            whatId: this.whatId,
            targetObjectIds: this.targetObjectIds,
        };

        if (event?.detail?.orgWideEmailAddressId) {
            emailRequest.orgWideEmailAddressId = event.detail.orgWideEmailAddressId;
        }

        console.log(emailRequest); // @debug

        sendEmail({emailRequest})
            .then((result) => {
                // close action event must be both bubbles and composed true
                // because this action component is not expected to be the root
                // component for the action-- an alternative to this might be
                // to handle and re-emit the event in the root component
                this.dispatchEvent(new CloseActionScreenEvent({
                    bubbles: true,
                    composed: true
                }));
                this.dispatchEvent(new ShowToastEvent({
                    title: "Emails Successfully Sent",
                    message: `Successfully sent ${this.recipientInfo.recipients.length} emails.`,
                    variant: "success"
                }));
            });
    }
}
