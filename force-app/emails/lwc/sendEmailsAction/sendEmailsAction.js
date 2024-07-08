import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import getFromAddressOptions from '@salesforce/apex/SendEmailsService.getFromAddressOptions';
import getRecipientInfo from '@salesforce/apex/SendEmailsService.getRecipientInfo';
import sendEmail from '@salesforce/apex/SendEmailsService.sendEmail';

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

    targetObjectApiName;
    recipientInfo = {};

    @wire(getRecipientInfo, {targetObjectIds: "$targetObjectIds"})
    wiredRecipientInfo(recipientInfoList) {
        if (recipientInfoList.data) {
            this.targetObjectApiName = recipientInfoList.data.objectApiName;
            this.recipientInfo.recipients = recipientInfoList.data.recipients;
        }
        // @todo handle errors
    }

    @wire(getObjectInfo, {objectApiName: "$targetObjectApiName"})
    wiredGetTargetObjectInfo(objectInfo) {
        if (objectInfo.data) {
            this.recipientInfo.iconUrl = objectInfo.data?.themeInfo.iconUrl;
            this.recipientInfo.color = objectInfo.data?.themeInfo.color;
            this.recipientInfo.colorStyle = `background-color: #${this.recipientInfo.color}`;
        }
        // @todo handle errors?
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

        const email = {
            subject: event?.detail?.subject,
            htmlBody: event?.detail?.htmlBody,
            whatId: this.whatId,
            targetObjectIds: this.targetObjectIds,
        };

        if (event?.detail?.orgWideEmailAddressId) {
            email.orgWideEmailAddressId = event.detail.orgWideEmailAddressId;
        }

        console.log(email); // @debug

        sendEmail({email});
    }
}
