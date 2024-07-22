import { LightningElement, api } from 'lwc';

export default class EmailDeliveryReport extends LightningElement {
    @api
    recipients;

    @api
    emailSendErrors;

    get columns() {
        const columns = [
            {
                label: "Recipient Name",
                fieldName: "displayName",
                type: "text"
            }
        ];

        if (this.recipients.some(r => Object.hasOwn(r, 'address'))) {
            columns.push(
                {
                    label: "Email",
                    fieldName: "address",
                    type: "email"
                }
            );
        }

        columns.push(
            {
                label: "Error Message",
                fieldName: "errors",
                type: "text"
            }
        );

        return columns;
    }

    get hasErrors() {
        return Object.keys(this.emailSendErrors).length > 0;
    }

    get errors() {
        const errorMap = new Map(Object.entries(this.emailSendErrors));

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
        // This component isn't expected to be the actual action component, so
        // in order to close the modal from this depth we configure the
        // CloseActionScreenEvent to be able to bubble all the way up to the
        // root.
        this.dispatchEvent(new CloseActionScreenEvent({
            bubbles: true,
            composed: true
        }));
    }
}
