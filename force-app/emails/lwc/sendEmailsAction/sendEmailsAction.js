import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ContactEmailField from '@salesforce/schema/Contact.Email';

import getFromAddressOptions from '@salesforce/apex/EmailController.getFromAddressOptions';
import getRecipientsById from '@salesforce/apex/EmailController.getRecipientsById';
import sendEmail from '@salesforce/apex/EmailController.sendEmail';

import emailErrorGetRecipients from '@salesforce/label/c.emailErrorGetRecipients';
import emailErrorGetFromAddress from '@salesforce/label/c.emailErrorGetFromAddress';
import errorEmailUnableToSend from '@salesforce/label/c.errorEmailUnableToSend';
import emailSentSuccess from '@salesforce/label/c.emailSentSuccess';
import emailSentSuccessMsg from '@salesforce/label/c.emailSentSuccessMsg';
import emailSendError from '@salesforce/label/c.emailSendError';

/**
 * This component allows users to send emails to multiple recipients (specified
 * as `targetObjectIds`).  The email can be related to a Salesforce record (as
 * the `whatId`).
 */
export default class SendEmailsAction extends LightningElement {
    label = {
    };

    /**
     * Does the current user have read access to the Contact.Email field?
     */
    hasEmailFieldAccess = false;

    /**
     * Get information about the Contact object and use it to determine whether
     * the user has read access to the Contact.Email field.
     */
    @wire(getObjectInfo, { objectApiName: ContactEmailField.objectApiName })
    wiredContactObjectInfo(result) {
        if (result.data) {
            this.hasEmailFieldAccess = Object.hasOwn(
                result.data.fields,
                ContactEmailField.fieldApiName
            );
        }
    }

    /**
     * The id of the record the email should be related to.
     */
    @api
    whatId;

    /**
     * The SObject API name of the record the email should be related to.
     */
    @api
    whatObjectApiName;

    /**
     * Get the name field of the related record.  This currently just assumes
     * the name field is `Name` on the related record object type, but this
     * isn't always true for some standard Salesforce objects.  This means
     * those cases are not currently supported by this component.
     */
    get whatObjectNameField() {
        return `${this.whatObjectApiName}.Name`;
    }

    /**
     * Get a list of fields to query for the related record, which should
     * include the name field so the name can be displayed to the user.
     */
    get whatObjectFields() {
        return [this.whatObjectNameField];
    }

    /**
     * An object which holds information about the related record, like its
     * name and some other display information like icon URL and icon color.
     */
    relatedTo = {};

    /**
     * Query for information about the related record.
     */
    @wire(getRecord, {recordId: "$whatId", fields: "$whatObjectFields"})
    wiredGetWhatRecord(record) {
        if (record.data) {
            this.relatedTo.name = getFieldValue(record.data, this.whatObjectNameField);
        }
    }

    /**
     * Query for additional display information about the related record, like
     * the icon URL and icon color.
     */
    @wire(getObjectInfo, {objectApiName: "$whatObjectApiName"})
    wiredGetObjectInfo(objectInfo) {
        if (objectInfo.data) {
            this.relatedTo.iconUrl = objectInfo.data?.themeInfo.iconUrl;
            this.relatedTo.color = objectInfo.data?.themeInfo.color;
        }
    }

    /**
     * The ids of the records to use as recipients for the email.
     */
    @api
    targetObjectIds;

    /**
     * A list of recipients for the email.  This is a list of objects with
     * information about each recipient, like their name and email address, and
     * may not include every recipient provided in the `targetObjectIds`
     * parameter (see `isRecipientsFiltered` below).
     */
    recipients;

    /**
     * Query for information about the recipients specified by `targetObjectIds`.
     */
    @wire(getRecipientsById, {targetObjectIds: "$targetObjectIds"})
    wiredRecipientInfo(recipients) {
        if (recipients.data) {
            this.recipients = recipients.data;
        } else if (recipients.error) {
            let messages = [emailErrorGetRecipients];

            if (recipients.error?.body?.message) {
                messages.push(recipients.error.body.message);
            }

            this.showToastError(messages.join('  '));
        }
    }

    /**
     * In some cases, the list of recipients might not correspond one-to-one
     * with the provided list of `targetObjectIds`.  This can happen if the
     * recipient is not a supported type, doesn't match an existing record, if
     * the user doesn't have record visibility, etc.  This method will indicate
     * whether any recipients might have been filtered out and are omitted from
     * the given list of `targetObjectIds`.  This information is useful for
     * indicating to the user that they might not be seeing all the recipients
     * they were expecting to, depending on how the recipient ids were provided
     * to this component.
     */
    get isRecipientsFiltered() {
        return Array.isArray(this.recipients)
            && Array.isArray(this.targetObjectIds)
            && this.recipients.length != this.targetObjectIds.length;
    }

    /**
     * Is there at least one recipient in the recipient list?
     */
    get hasRecipients() {
        return Array.isArray(this.recipients) && this.recipients.length > 0;
    }

    /**
     * A list of originator options.  This would include the default option of
     * the current user's email address as well as any org-wide email addresses
     * the current user has access to.
     */
    fromAddressOptions = [];

    /**
     * Query for originator options.
     */
    @wire(getFromAddressOptions)
    wiredFromAddressOptions(result) {
        if (result.data) {
            this.fromAddressOptions = result.data;
        } else if (result.error) {
            let messages = [emailErrorGetFromAddress];

            if (result.error?.body?.message) {
                messages.push(result.error.body.message);
            }

            this.showToastError(messages.join('  '));
        }
    }

    /**
     * If there were any errors while sending the email, they will be saved here.
     */
    emailSendErrors = {};

    /**
     * Were there any emails while sending the email?
     */
    get hasEmailSendErrors() {
        return Object.keys(this.emailSendErrors).length > 0;
    }

    /**
     * Handle the "sendemail" event by sending the email using details from the
     * event and properties of this component.
     */
    handleSendEmail(event) {
        const emailRequest = {
            subject: event?.detail?.subject,
            htmlBody: event?.detail?.htmlBody,
            targetObjectIds: this.recipients?.map(r => r.id),
            whatId: this.whatId,
        };

        if (event?.detail?.orgWideEmailAddressId) {
            emailRequest.orgWideEmailAddressId = event.detail.orgWideEmailAddressId;
        }

        sendEmail({emailRequest})
            .then((result) => {
                if (Object.keys(result.errors).length > 0) {
                    // Some error messages for some recipients were returned,
                    // so save the errors (which should cause the delivery
                    // report to be shown)
                    this.emailSendErrors = result.errors;
                } else {
                    // No error messages were returned, so we can consider all
                    // emails successfully sent.  Close the modal and show a
                    // success toast message.
                    this.closeAction();
                    this.dispatchEvent(new ShowToastEvent({
                        title: emailSentSuccess,
                        message: emailSentSuccessMsg,
                        messageData: [`${emailRequest.targetObjectIds.length}`],
                        variant: "success"
                    }));
                }
            })
            .catch((error) => {
                // The sendEmail Apex method or the success handler threw
                // an exception, so show it to the user as a toast message.
                let messages = [errorEmailUnableToSend];

                if (error.body?.message) {
                    messages.push(error.body.message);
                }

                this.showToastError(messages.join('  '));
            });
    }

    /**
     * Utility method to show a toast error message.
     */
    showToastError(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: emailSendError,
            message: message,
            variant: "error",
            mode: "sticky"
        }));
    }

    handleCloseAction(event) {
        this.closeAction();
    }

    closeAction() {
        // This component isn't expected to be the actual
        // action component, so in order to close the
        // modal from this depth we configure the
        // CloseActionScreenEvent to be able to bubble
        // all the way up to the root.
        this.dispatchEvent(new CloseActionScreenEvent({
            bubbles: true,
            composed: true
        }));
    }
}
