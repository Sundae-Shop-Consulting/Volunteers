@IsTest
public with sharing class TestDataFactoryBase {
    public static List<Account> generateAccounts(Integer count) {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < count; i++) {
            accts.add(new Account(
                Name = 'Test Account ' + (i + 1)
            ));
        }
        return accts;
    }

    public static List<Account> insertAccounts(Integer count) {
        List<Account> accts = generateAccounts(count);
        insert accts;
        return accts;
    }
    
    public static List<Contact> generateContacts(Integer count) {
        List<Account> accts = insertAccounts(count);
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < count; i++) {
            cons.add(new Contact(
                FirstName = 'Test',
                LastName = 'Contact ' + (i + 1),
                AccountId = accts[i].Id
            ));
        }
        return cons;
    }

    public static List<Contact> insertContacts(Integer count) {
        List<Contact> cons = generateContacts(count);
        insert cons;
        return cons;
    }

    public static List<VolunteerPosition__c> generatePositions(Integer count) {
        List<VolunteerPosition__c> positions = new List<VolunteerPosition__c>();
        for (Integer i = 0; i < count; i++) {
            positions.add(new VolunteerPosition__c(
                Name = 'Test Position ' + (i + 1)
            ));
        }
        return positions;
    }

    public static List<VolunteerPosition__c> insertPositions(Integer count) {
        List<VolunteerPosition__c> positions = generatePositions(count);
        insert positions;
        return positions;
    }

    public static List<VolunteerActivity__c> generateActivities(Integer count, Id volunteerPositionId) {
        List<VolunteerActivity__c> activities = new List<VolunteerActivity__c>();
        for (Integer i = 0; i < count; i++) {
            activities.add(new VolunteerActivity__c(
                Name = 'Test Activity ' + (i + 1),
                VolunteerPosition__c = volunteerPositionId
            ));
        }
        return activities;
    }

    public static List<VolunteerActivity__c> insertActivities(Integer count, Id volunteerPositionId) {
        List<VolunteerActivity__c> activities = generateActivities(count, volunteerPositionId);
        insert activities;
        return activities;
    }

    public static VolunteerPositionAssignment__c generatePositionAssignment(Id volunteerContactId, Id volunteerPositionId, String status) {
        return new VolunteerPositionAssignment__c(
            VolunteerContact__c = volunteerContactId,
            VolunteerPosition__c = volunteerPositionId,
            Status__c = status
        );
    }

    public static List<VolunteerPositionAssignment__c> generatePositionAssignments(List<Id> volunteerContactIds, List<Id> volunteerPositionIds, String status) {
        List<VolunteerPositionAssignment__c> positionAssignments = new List<VolunteerPositionAssignment__c>();
        for (Id contactId : volunteerContactIds) {
            for (Id volunteerPositionId : volunteerPositionIds) {
                positionAssignments.add(
                    generatePositionAssignment(contactId, volunteerPositionId, status)
                );
            }
        }
        return positionAssignments;
    }

    public static List<VolunteerPositionAssignment__c> insertPositionAssignments(List<Id> volunteerContactIds, List<Id> volunteerPositionIds, String status) {
        List<VolunteerPositionAssignment__c> positionAssignments = generatePositionAssignments(volunteerContactIds, volunteerPositionIds, status);
        insert positionAssignments;
        return positionAssignments;
    }
    
    public static VolunteerActivityAssignment__c generateActivityAssignment(Id volunteerContactId, Id volunteerActivityId, String status) {
        return new VolunteerActivityAssignment__c(
            VolunteerContact__c = volunteerContactId,
            VolunteerActivity__c = volunteerActivityId,
            Status__c = status
        );
    }

    public static List<VolunteerActivityAssignment__c> generateActivityAssignments(List<Id> volunteerContactIds, List<Id> volunteerActivityIds, String status) {
        List<VolunteerActivityAssignment__c> activityAssignments = new List<VolunteerActivityAssignment__c>();
        for (Id contactId : volunteerContactIds) {
            for (Id volunteerActivityId : volunteerActivityIds) {
                activityAssignments.add(
                    generateActivityAssignment(contactId, volunteerActivityId, status)
                );
            }
        }
        return activityAssignments;
    }

    public static List<VolunteerActivityAssignment__c> insertActivityAssignments(List<Id> volunteerContactIds, List<Id> volunteerActivityIds, String status) {
        List<VolunteerActivityAssignment__c> activityAssignments = generateActivityAssignments(volunteerContactIds, volunteerActivityIds, status);
        insert activityAssignments;
        return activityAssignments;
    }

    public static VolunteerHoursLog__c generateVolunteerHoursLog(Id volunteerContactId, Id volunteerActivityId, DateTime startDateTime, DateTime endDateTime) {
        return new VolunteerHoursLog__c(
            VolunteerContact__c = volunteerContactId,    
            VolunteerActivity__c = volunteerActivityId,
            StartDateTime__c = startDateTime,
            EndDateTime__c = endDateTime
        );
    }

    public static VolunteerHoursLog__c generateVolunteerHoursLog(Id volunteerContactId, Id volunteerActivityId, DateTime startDateTime, Decimal hours) {
        return new VolunteerHoursLog__c(
            VolunteerContact__c = volunteerContactId,    
            VolunteerActivity__c = volunteerActivityId,
            StartDateTime__c = startDateTime,
            Hours__c = hours
        );
    }

    public static VolunteerHoursLog__c queryLog(Id logId) {
        List<VolunteerHoursLog__c> logs = [SELECT Id, VolunteerActivity__c, VolunteerContact__c, StartDateTime__c, EndDateTime__c, Hours__c FROM VolunteerHoursLog__c WHERE Id = :logId LIMIT 1];
        if (logs.isEmpty()) {
            throw new TestDataException('No VolunteerHoursLog record found with Id: ' + logId);
        }
        return logs[0];
    }

    public class TestDataException extends Exception {}
        
}