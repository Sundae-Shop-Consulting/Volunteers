@IsTest
public with sharing class TestDataFactoryScenarios {
    public static VolunteerPositionAssignment__c createActiveVolunteer() {
        Contact volunteerContact = TestDataFactoryBase.insertContacts(1)[0];
        VolunteerPosition__c position = TestDataFactoryBase.insertPositions(1)[0];
        VolunteerPositionAssignment__c positionAssignment = TestDataFactoryBase.insertPositionAssignments(new List<Id>{volunteerContact.Id}, new List<Id>{position.Id}, 'Active')[0];
        return positionAssignment;
    }

    public static VolunteerActivityAssignment__c assignVolunteerToActivity() {
        VolunteerPositionAssignment__c positionAssignment = createActiveVolunteer();
        VolunteerActivity__c activity = TestDataFactoryBase.insertActivities(1, positionAssignment.VolunteerPosition__c)[0];
        VolunteerActivityAssignment__c activityAssignment = TestDataFactoryBase.insertActivityAssignments(new List<Id>{positionAssignment.VolunteerContact__c}, new List<Id>{activity.Id}, 'Open')[0];
        return activityAssignment;
    } 

}