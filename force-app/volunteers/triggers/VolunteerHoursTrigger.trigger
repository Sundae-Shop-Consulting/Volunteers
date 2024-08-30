trigger VolunteerHoursTrigger on VolunteerHoursLog__c (before insert, before update) {
    VolunteerHoursCalculations calculator = new VolunteerHoursCalculations();

    if (Trigger.isInsert) {
        for (VolunteerHoursLog__c log : Trigger.new) {
            calculator.calculateInsertedLog(log);
        }
    } else if (Trigger.isUpdate) {
        for (Id logId : Trigger.newMap.keySet()) {
            calculator.calculateUpdatedLog(Trigger.oldMap.get(logId), Trigger.newMap.get(logId));
        }
    }
}