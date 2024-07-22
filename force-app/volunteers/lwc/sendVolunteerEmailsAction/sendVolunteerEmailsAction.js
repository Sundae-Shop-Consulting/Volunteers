import { LightningElement, api } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAssignedVolunteerIds from '@salesforce/apex/EmailVolunteersController.getAssignedVolunteerIds';

export default class SendVolunteerEmailsAction extends LightningElement {
    _recordId;

    @api
    get recordId() {
        return this._recordId;
    }

    set recordId(value) {
        this._recordId = value;
        this.updateAssignedVolunteerIds(value);
    }

    @api
    objectApiName;

    assignedVolunteerIds;

    get hasAssignedVolunteerIds() {
        return !!this.assignedVolunteerIds?.length;
    }

    updateAssignedVolunteerIds(recordId) {
        getAssignedVolunteerIds({recordId: recordId})
            .then((assignedVolunteerIds) => {
                if (Array.isArray(assignedVolunteerIds) && assignedVolunteerIds.length > 0) {
                    this.assignedVolunteerIds = assignedVolunteerIds;
                } else {
                    this.dispatchEvent(new CloseActionScreenEvent());
                    this.dispatchEvent(new ShowToastEvent({
                        title: 'Email Volunteers',
                        message: 'No volunteers assigned.',
                    }));
                }
            }).catch((error) => {
                let messages = ['An error occurred.'];

                if (error?.body?.message) {
                    messages.push(error.body.message);
                }

                this.dispatchEvent(new CloseActionScreenEvent());

                this.dispatchEvent(new ShowToastEvent({
                    title: 'Email Volunteers Error',
                    message: messages.join('  '),
                    variant: "error"
                }));
            });
    }
}
