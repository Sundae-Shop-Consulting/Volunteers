/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
trigger dlrs_VolunteerPositionAssignmentTrigger on %%%NAMESPACE%%%VolunteerPositionAssignment__c
    (before delete, before insert, before update, after delete, after insert, after undelete, after update)
{
    dlrs.RollupService.triggerHandler(%%%NAMESPACE%%%VolunteerPositionAssignment__c.SObjectType);
}