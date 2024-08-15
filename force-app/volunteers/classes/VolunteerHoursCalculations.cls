public with sharing class VolunteerHoursCalculations {


    public void calculateInsertedLog(VolunteerHoursLog__c log) {
        if (isValidInsert(log)) {
            populateLog(log);
        } else {
            throw new VolunteerHoursValidationException('Start Date/Time, End Date/Time and Hours are missing or have conflicting values');
        }
    }

    public void calculateUpdatedLog(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        if (isValidUpdate(oldLog, newLog)) {
            updateLog(oldLog, newLog);
        } else {
            throw new VolunteerHoursValidationException('Start Date/Time, End Date/Time and Hours are missing or have conflicting values');
        }
    }

    private Integer countPopulatedRelevantFields(VolunteerHoursLog__c log) {
        Integer countOfPopulatedFields = 0;
        if (log.StartDateTime__c != null) {
            countOfPopulatedFields++;
        }
        if (log.EndDateTime__c != null) {
            countOfPopulatedFields++;
        }
        if (log.Hours__c != null) {
            countOfPopulatedFields++;
        }
        return countOfPopulatedFields;
    }

    private Integer countUpdatedRelevantFields(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        Integer countOfUpdatedFields = 0;
        if (oldLog.StartDateTime__c != newLog.StartDateTime__c) {
            countOfUpdatedFields++;
        }
        if (oldLog.EndDateTime__c != newLog.EndDateTime__c) {
            countOfUpdatedFields++;
        }
        if (oldLog.Hours__c != newLog.Hours__c) {
            countOfUpdatedFields++;
        }
        return countOfUpdatedFields;
    }

    private Boolean dateTimesAndHoursAddUp(VolunteerHoursLog__c log) {
        Integer minutes = log.Hours__c.intValue() * 60;
        return (log.StartDateTime__c.addMinutes(minutes) == log.EndDateTime__c);
    }

    @TestVisible
    private Boolean isValidInsert(VolunteerHoursLog__c log) {
        Integer countOfPopulatedFields = countPopulatedRelevantFields(log);
        if (countOfPopulatedFields == 2) {
            return true;
        } else if (countOfPopulatedFields == 3 && dateTimesAndHoursAddUp(log)) {
            return true;
        } else {
            return false;
        }
    }

    @TestVisible
    private Boolean isValidUpdate(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        Integer countOfUpdatedFields = countUpdatedRelevantFields(oldLog, newLog);
        if (countOfUpdatedFields < 3) {
            return true;
        } else if (countPopulatedRelevantFields(newLog) == 3 && dateTimesAndHoursAddUp(newLog)) {
            return true;
        }
        return false;
    }

    private void populateLog(VolunteerHoursLog__c log) {
        if (log.StartDateTime__c == null) {
            log.StartDateTime__c = calculateStartDateTime(log.EndDateTime__c, log.Hours__c);
        } else if (log.EndDateTime__c == null) {
            log.EndDateTime__c = calculateEndDateTime(log.StartDateTime__c, log.Hours__c);
        } else if (log.Hours__c == null) {
            log.Hours__c = calculateHours(log.StartDateTime__c, log.EndDateTime__c);
        } 
    }

    private void updateLog(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        Integer countOfUpdatedFields = countUpdatedRelevantFields(oldLog, newLog);
        if (countOfUpdatedFields == 1) {
            if (isStartDateTimeChanged(oldLog, newLog)) {
                updateHours(newLog);
            } else if (isEndDateTimeChanged(oldLog, newLog)) {
                updateHours(newLog);
            } else if (isHoursChanged(oldLog, newLog)) {
                updateEndDateTime(newLog);
            }
        } else if (countOfUpdatedFields == 2) {
            if (isStartDateTimeChanged(oldLog, newLog) && isEndDateTimeChanged(oldLog, newLog)) {
                updateHours(newLog);
            } else if (isEndDateTimeChanged(oldLog, newLog) && isHoursChanged(oldLog, newLog)) {
                updateStartDateTime(newLog);
            } else if (isHoursChanged(oldLog, newLog) && isStartDateTimeChanged(oldLog, newLog)) {
                updateEndDateTime(newLog);
            }
        }
    }

    private void updateHours(VolunteerHoursLog__c log) {
        log.Hours__c = calculateHours(log.StartDateTime__c, log.EndDateTime__c);
    }

    private void updateEndDateTime(VolunteerHoursLog__c log) {
        log.EndDateTime__c = calculateEndDateTime(log.StartDateTime__c, log.Hours__c);
    }

    private void updateStartDateTime(VolunteerHoursLog__c log) {
        log.StartDateTime__c = calculateStartDateTime(log.EndDateTime__c, log.Hours__c);
    }


    private Boolean isStartDateTimeChanged(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        return oldLog.StartDateTime__c != newLog.StartDateTime__c;
    }

    private Boolean isEndDateTimeChanged(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        return oldLog.EndDateTime__c != newLog.EndDateTime__c;
    }

    private Boolean isHoursChanged(VolunteerHoursLog__c oldLog, VolunteerHoursLog__c newLog) {
        return oldLog.Hours__c != newLog.Hours__c;
    }
    
    @TestVisible
    private DateTime calculateStartDateTime(DateTime endDateTime, Decimal hours) {
        // addHours doesn't support decimal values. sigh.
        Integer minutes = Math.round(hours * 60);
        return endDateTime.addMinutes(0 - minutes);
    }

    @TestVisible
    private DateTime calculateEndDateTime(DateTime startDateTime, Decimal hours) {
        Integer minutes = Math.round(hours * 60);
        return startDateTime.addMinutes(minutes);
    }

    @TestVisible
    private Decimal calculateHours(DateTime startDateTime, DateTime endDateTime) {
        return hoursBetween(endDateTime, startDateTime);
    }

    private Decimal hoursBetween(DateTime endDateTime, DateTime startDateTime) {
        Long startMilliseconds = startDateTime.getTime();
        Long endMilliseconds = endDateTime.getTime();
        
        Long milliseconds = endMilliseconds - startMilliseconds;
        Decimal hours = milliseconds / (1000.0 * 60 * 60);
        return hours;
    }

    public class VolunteerHoursValidationException extends Exception {}
}