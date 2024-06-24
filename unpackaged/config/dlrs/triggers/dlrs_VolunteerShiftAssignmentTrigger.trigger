/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
trigger dlrs_VolunteerShiftAssignmentTrigger on VolunteerShiftAssignment__c
    (before delete, before insert, before update, after delete, after insert, after undelete, after update)
{
    dlrs.RollupService.triggerHandler(VolunteerShiftAssignment__c.SObjectType);
}