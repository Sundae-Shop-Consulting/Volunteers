@IsTest
private class VolunteerHoursLogTrigger_TEST {

    private static VolunteerActivityAssignment__c activityAssignment;
    private static Date dateSixMonthsAgo = System.today().addMonths(-6);
    private static DateTime dateTimeSixMonthsAgo = DateTime.newInstance(dateSixMonthsAgo.year(), dateSixMonthsAgo.month(), dateSixMonthsAgo.day(), 8, 0, 0);

    @TestSetup
    static void setupData(){
        activityAssignment = TestDataFactoryScenarios.assignVolunteerToActivity();
    }

    private static VolunteerActivityAssignment__c queryActivityAssignment() {
        return [SELECT Id, VolunteerContact__c, VolunteerActivity__c FROM VolunteerActivityAssignment__c LIMIT 1][0];
    }

    @IsTest
    private static void testInsertHoursLogWithStartDateTimeAndHours() {
        activityAssignment = queryActivityAssignment();
        VolunteerHoursLog__c log = TestDataFactoryBase.generateVolunteerHoursLog(
                activityAssignment.VolunteerContact__c,
                activityAssignment.VolunteerActivity__c,
                dateTimeSixMonthsAgo,
                2
        );
        Test.startTest();
        insert log;
        Test.stopTest();

        log = TestDataFactoryBase.queryLog(log.Id);

        System.assertEquals(dateTimeSixMonthsAgo.addHours(2), log.EndDateTime__c, 'End Date/Time should be populated');
        System.assertEquals(2, log.Hours__c, 'Hours should not have changed');
        System.assertEquals(dateTimeSixMonthsAgo, log.StartDateTime__c, 'Start Date/Time should not have changed');
    }

    @IsTest
    private static void testInsertHoursLogWithStartDateTimeAndEndDateTime() {
        activityAssignment = queryActivityAssignment();
        VolunteerHoursLog__c log = TestDataFactoryBase.generateVolunteerHoursLog(
                activityAssignment.VolunteerContact__c,
                activityAssignment.VolunteerActivity__c,
                dateTimeSixMonthsAgo,
                dateTimeSixMonthsAgo.addHours(7)
        );
        Test.startTest();
        insert log;
        Test.stopTest();

        log = TestDataFactoryBase.queryLog(log.Id);

        System.assertEquals(7, log.Hours__c, 'Hours should be calculated');
        System.assertEquals(dateTimeSixMonthsAgo, log.StartDateTime__c, 'Start Date/Time should not have changed');
        System.assertEquals(dateTimeSixMonthsAgo.addHours(7), log.EndDateTime__c, 'End Date/Time should not have changed');
    }

    @IsTest
    private static void testUpdateHoursLogHours() {
        activityAssignment = queryActivityAssignment();
        VolunteerHoursLog__c log = TestDataFactoryBase.generateVolunteerHoursLog(
                activityAssignment.VolunteerContact__c,
                activityAssignment.VolunteerActivity__c,
                dateTimeSixMonthsAgo,
                2
        );
        insert log;

        log.Hours__c = 5;

        Test.startTest();
        update log;
        Test.stopTest();

        log = TestDataFactoryBase.queryLog(log.Id);

        System.assertEquals(dateTimeSixMonthsAgo.addHours(5), log.EndDateTime__c, 'End Date/Time should be updated to new calculated value');
        System.assertEquals(5, log.Hours__c, 'Hours should be updated');
        System.assertEquals(dateTimeSixMonthsAgo, log.StartDateTime__c, 'Start Date/Time should not have changed');
    }

    @IsTest
    private static void testUpdateHoursLogEndDateTime() {
        activityAssignment = queryActivityAssignment();
        VolunteerHoursLog__c log = TestDataFactoryBase.generateVolunteerHoursLog(
                activityAssignment.VolunteerContact__c,
                activityAssignment.VolunteerActivity__c,
                dateTimeSixMonthsAgo,
                dateTimeSixMonthsAgo.addHours(7)
        );
        insert log;

        log.EndDateTime__c = dateTimeSixMonthsAgo.addHours(2);

        Test.startTest();
        update log;
        Test.stopTest();

        log = TestDataFactoryBase.queryLog(log.Id);

        System.assertEquals(2, log.Hours__c, 'Hours should be updated to new calculated value');
        System.assertEquals(dateTimeSixMonthsAgo, log.StartDateTime__c, 'Start Date/Time should not have changed');
        System.assertEquals(dateTimeSixMonthsAgo.addHours(2), log.EndDateTime__c, 'End Date/Time should have changed');
    }
}