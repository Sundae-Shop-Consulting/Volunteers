public with sharing class VolunteerAssignmentService {
    @AuraEnabled
    public static List<Id> getAssignedVolunteerIds(Id recordId) {
        List<Id> assignedVolunteerIds = new List<Id>();

        Schema.SObjectType sot = recordId.getSObjectType();

        if (sot == VolunteerShift__c.sObjectType) {
            for (VolunteerShiftAssignment__c assignment : [
                SELECT VolunteerContact__c
                FROM VolunteerShiftAssignment__c
                WHERE VolunteerShift__c = :recordId
                WITH USER_MODE
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        if (sot == VolunteerPosition__c.sObjectType) {
            for (VolunteerPositionAssignment__c assignment : [
                SELECT VolunteerContact__c
                FROM VolunteerPositionAssignment__c
                WHERE VolunteerPosition__c = :recordId
                WITH USER_MODE
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        if (sot == VolunteerActivity__c.sObjectType) {
            for (VolunteerActivityAssignment__c assignment : [
                    SELECT VolunteerContact__c
                    FROM VolunteerActivityAssignment__c
                    WHERE VolunteerActivity__c = :recordId
                    WITH USER_MODE
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        return assignedVolunteerIds;
    }
}
