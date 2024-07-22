/**
 * This service class provides methods for getting information about volunteers
 * that are assigned to other volunteer records (i.e. shifts, positions, or
 * activities).
 */
public with sharing class VolunteerAssignmentService {
    /**
     * Return a set of Contact ids of volunteers that are assigned to the given
     * VolunteerPosition__c, VolunteerShift__c, or VolunteerActivity__c
     * recordId.
     *
     * Note that this returns a *set* of Contact ids based on the assignment
     * records visible to the current running user.  If a volunteer is assigned
     * to the record more than once (i.e. more than one assignment record
     * exists for the volunteer and the given record id), the volunteer id is
     * included only once in the set.
     */
    public Set<Id> getAssignedVolunteerIds(Id recordId) {
        Set<Id> assignedVolunteerIds = new Set<Id>();

        Schema.SObjectType sot = recordId.getSObjectType();

        if (sot == VolunteerShift__c.sObjectType) {
            Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
                VolunteerShiftAssignment__c.VolunteerContact__c,
                VolunteerShiftAssignment__c.VolunteerShift__c
            };

            if (!isAccessible(fields)) {
                return new Set<Id>();
            }

            for (VolunteerShiftAssignment__c assignment : [
                SELECT VolunteerContact__c
                FROM VolunteerShiftAssignment__c
                WHERE VolunteerShift__c = :recordId
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        if (sot == VolunteerPosition__c.sObjectType) {
            Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
                VolunteerPositionAssignment__c.VolunteerContact__c,
                VolunteerPositionAssignment__c.VolunteerPosition__c
            };

            if (!isAccessible(fields)) {
                return new Set<Id>();
            }

            for (VolunteerPositionAssignment__c assignment : [
                SELECT VolunteerContact__c
                FROM VolunteerPositionAssignment__c
                WHERE VolunteerPosition__c = :recordId
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        if (sot == VolunteerActivity__c.sObjectType) {
            Set<Schema.SObjectField> fields = new Set<Schema.SObjectField>{
                VolunteerActivityAssignment__c.VolunteerContact__c,
                VolunteerActivityAssignment__c.VolunteerActivity__c
            };

            if (!isAccessible(fields)) {
                return new Set<Id>();
            }

            for (VolunteerActivityAssignment__c assignment : [
                    SELECT VolunteerContact__c
                    FROM VolunteerActivityAssignment__c
                    WHERE VolunteerActivity__c = :recordId
            ]) {
                assignedVolunteerIds.add(assignment.VolunteerContact__c);
            }
        }

        return assignedVolunteerIds;
    }

    /**
     * Convenience method for checking if a set of SObject fields are
     * accessible (readable) for the current running user.  Returns false if
     * any field is inaccessible, otherwise returns true.
     */
    private Boolean isAccessible(Set<Schema.SObjectField> fields) {
        Boolean isAccessible = true;

        for (Schema.SObjectField field : fields) {
            isAccessible &= field.getDescribe().isAccessible();
        }

        return isAccessible;
    }
}
