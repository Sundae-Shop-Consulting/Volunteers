/**
 * This controller allows front-end components to get information about
 * volunteers for the purposes of sending emails.
 */
public with sharing class EmailVolunteersController {
    /**
     * Return a list of Contact ids which represent the volunteers assigned to
     * the given VolunteerShift__c, VolunteerPosition__c, or
     * VolunteerActivity__c recordId.
     */
    @AuraEnabled
    public static List<Id> getAssignedVolunteerIds(Id recordId) {
        VolunteerAssignmentService service = new VolunteerAssignmentService();
        return new List<Id>(service.getAssignedVolunteerIds(recordId));
    }
}
