@IsTest
private class VolunteerHoursCalculations_TEST {
    private static VolunteerActivityAssignment__c activityAssignment;
    private static Date dateSixMonthsAgo = System.today().addMonths(-6);
    private static DateTime dateTimeSixMonthsAgo = DateTime.newInstance(dateSixMonthsAgo.year(), dateSixMonthsAgo.month(), dateSixMonthsAgo.day(), 8, 0, 0);
    private static VolunteerHoursCalculations calculator = new VolunteerHoursCalculations();

    @TestSetup
    static void setupData(){
        activityAssignment = TestDataFactoryScenarios.assignVolunteerToActivity();
    }

    private static VolunteerActivityAssignment__c queryActivityAssignment() {
        return [SELECT Id, VolunteerContact__c, VolunteerActivity__c FROM VolunteerActivityAssignment__c LIMIT 1][0];
    }

    private static VolunteerHoursLog__c createBaseLog() {
        activityAssignment = queryActivityAssignment();
        return new VolunteerHoursLog__c(
            VolunteerContact__c = activityAssignment.VolunteerContact__c,
            VolunteerActivity__c = activityAssignment.VolunteerActivity__c,
            StartDateTime__c = null,
            EndDateTime__c = null,
            Hours__c = null
        );
    }

    private static VolunteerHoursLog__c createBaseLogPopulated() {
        VolunteerHoursLog__c log = createBaseLog();
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(5);
        log.Hours__c = 5;
        return log;
    }
    
    @IsTest
    private static void testInvalidHoursLogMissingInfo() {
        VolunteerHoursLog__c log = createBaseLog();
        System.assertEquals(false, calculator.isValidInsert(log));
    }

    @IsTest
    private static void testInvalidHoursLogMissingEndDateAndHours() {
        VolunteerHoursLog__c log = createBaseLog();
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        System.assertEquals(false, calculator.isValidInsert(log));
    }

    @IsTest
    private static void testInvalidHoursLogMissingStartDateAndHours() {
        VolunteerHoursLog__c log = createBaseLog();
        log.EndDateTime__c = dateTimeSixMonthsAgo;
        System.assertEquals(false, calculator.isValidInsert(log));
    }

    @IsTest
    private static void testInvalidHoursLogMissingStartAndEndDate() {
        VolunteerHoursLog__c log = createBaseLog();
        log.Hours__c = 5;
        System.assertEquals(false, calculator.isValidInsert(log));
    }

    @IsTest
    private static void testInvalidHoursLogDataDoesntAddUp() {
        VolunteerHoursLog__c log = createBaseLog();
        log.Hours__c = 5;
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(7);
        System.assertEquals(false, calculator.isValidInsert(log));
    }

    @IsTest
    private static void testValidHoursLogDataAddsUp() {
        VolunteerHoursLog__c log = createBaseLog();
        log.Hours__c = 5;
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(5);
        System.assert(calculator.isValidInsert(log));
    }

    @IsTest
    private static void testValidHoursLogCalculateHours() {
        VolunteerHoursLog__c log = createBaseLog();
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(5);
        System.assertEquals(5, calculator.calculateHours(log.StartDateTime__c, log.EndDateTime__c));
    }

    @IsTest
    private static void testValidHoursLogCalculateStartDateTime() {
        VolunteerHoursLog__c log = createBaseLog();
        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(5);
        log.Hours__c = 5;
        System.assertEquals(dateTimeSixMonthsAgo, calculator.calculateStartDateTime(log.EndDateTime__c, log.Hours__c));
    }

    @IsTest
    private static void testValidHoursLogCalculateEndDateTime() {
        VolunteerHoursLog__c log = createBaseLog();
        log.StartDateTime__c = dateTimeSixMonthsAgo;
        log.Hours__c = 5;
        System.assertEquals(dateTimeSixMonthsAgo.addHours(5), calculator.calculateEndDateTime(log.StartDateTime__c, log.Hours__c));
    }

    @IsTest 
    private static void testInvalidHoursLogUpdateMissingInfo() {
        VolunteerHoursLog__c oldLog = createBaseLogPopulated();
        VolunteerHoursLog__c newLog = createBaseLog();
        System.assertEquals(false, calculator.isValidUpdate(oldLog, newLog));
    }

    @IsTest
    private static void testInvalidHoursLogUpdateDataDoesntAddUp() {
        VolunteerHoursLog__c oldLog = createBaseLog();
        oldLog.Hours__c = 3;
        oldLog.StartDateTime__c = dateTimeSixMonthsAgo.addHours(3);
        oldLog.EndDateTime__c = dateTimeSixMonthsAgo.addHours(6);
        // all values change
        VolunteerHoursLog__c newLog = createBaseLog();
        newLog.Hours__c = 5;
        newLog.StartDateTime__c = dateTimeSixMonthsAgo;
        newLog.EndDateTime__c = dateTimeSixMonthsAgo.addHours(7);
        System.assertEquals(false, calculator.isValidUpdate(oldLog, newLog));
    }

    @IsTest
    private static void testValidHoursLogUpdateDataAddsUp() {
        VolunteerHoursLog__c oldLog = createBaseLog();
        oldLog.Hours__c = 3;
        oldLog.StartDateTime__c = dateTimeSixMonthsAgo.addHours(3);
        oldLog.EndDateTime__c = dateTimeSixMonthsAgo.addHours(6);
        // all values change
        VolunteerHoursLog__c newLog = createBaseLog();
        newLog.Hours__c = 5;
        newLog.StartDateTime__c = dateTimeSixMonthsAgo;
        newLog.EndDateTime__c = dateTimeSixMonthsAgo.addHours(5);
        System.assert(calculator.isValidUpdate(oldLog, newLog));
    }

    @IsTest
    private static void testValidHoursLogUpdateHoursChanged() {
        VolunteerHoursLog__c oldLog = createBaseLogPopulated();
        VolunteerHoursLog__c newLog = createBaseLogPopulated();
        newLog.Hours__c = 7;
        System.assert(calculator.isValidUpdate(oldLog, newLog));
    }

    @IsTest
    private static void testValidHoursLogUpdateStartDateTimeChanged() {
        VolunteerHoursLog__c oldLog = createBaseLogPopulated();
        VolunteerHoursLog__c newLog = createBaseLogPopulated();
        newLog.StartDateTime__c = dateTimeSixMonthsAgo.addHours(1);
        System.assert(calculator.isValidUpdate(oldLog, newLog));
    }

    @IsTest
    private static void testValidHoursLogUpdateEndDateTimeChanged() {
        VolunteerHoursLog__c oldLog = createBaseLogPopulated();
        VolunteerHoursLog__c newLog = createBaseLogPopulated();
        newLog.EndDateTime__c = dateTimeSixMonthsAgo.addHours(9);
        System.assert(calculator.isValidUpdate(oldLog, newLog));
    }

}