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
            VolunteerActivity__c = activityAssignment.VolunteerActivity__c
        );
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
}