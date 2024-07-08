import { LightningElement, api } from 'lwc';
import getAssignedVolunteerIds from '@salesforce/apex/VolunteerAssignmentService.getAssignedVolunteerIds';

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
                }
                // @todo handle not array or empty array
            });
            // @todo handle promise errors
    }
}
