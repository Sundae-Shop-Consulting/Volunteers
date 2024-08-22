import { LightningElement, api } from 'lwc';

import emailNotSentHeading from '@salesforce/label/c.emailNotSentHeading';
import emailCloseButton from '@salesforce/label/c.emailCloseButton';
import emailRecipientNameLabel from '@salesforce/label/c.emailRecipientNameLabel';
import emailEmailLabel from '@salesforce/label/c.emailEmailLabel';
import emailErrorMessageLabel from '@salesforce/label/c.emailErrorMessageLabel';
import emailDeliveryReportHeading from '@salesforce/label/c.emailDeliveryReportHeading';
import emailSentSuccessMsg from '@salesforce/label/c.emailSentSuccessMsg';

export default class EmailDeliveryReport extends LightningElement {
    label = {
        emailNotSentHeading,
        emailCloseButton,
        emailDeliveryReportHeading,
    };

    @api
    hasEmailFieldAccess = false;

    @api
    recipients;

    @api
    emailSendResult;

    get columns() {
        const columns = [
            {
                label: emailRecipientNameLabel,
                fieldName: "displayName",
                type: "text"
            }
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

        columns.push(
            {
                label: emailErrorMessageLabel,
                fieldName: "errors",
                type: "text"
            }
        );

        return columns;
    }

    get hasSuccess() {
        return this.emailSendResult?.successCount > 0;
    }

    get successCountMsg() {
        return emailSentSuccessMsg.replaceAll(
            '{0}',
            this.emailSendResult.successCount
        );
    }

    get hasErrors() {
        return !!this.emailSendResult?.hasErrors;
    }

    get errors() {
        const errorMap = new Map(Object.entries(this.emailSendResult.errors));

        const errors = [];

        this.recipients.forEach((recipient) => {
            if (errorMap.has(recipient.id)) {
                errors.push({
                    ...recipient,
                    errors: errorMap.get(recipient.id)
                });
            }
        });

        return errors;
    }

    handleClose(event) {
        this.dispatchEvent(new CustomEvent("closeaction"));
    }
}
