/**
 * This service class provides methods for retrieving email addresses that are
 * configured or defined in the org, including the current running user's email
 * address or org-wide email addresses which are accessible by the current
 * running user.
*/
public with sharing class EmailAddressService {
    /**
     * Get the current running user's email address (and display name)
     */
    public EmailAddress getCurrentUserEmailAddress() {
        return new EmailAddress(
            UserInfo.getUserId(),
            UserInfo.getName(),
            UserInfo.getUserEmail()
        );
    }
    
    /**
     * Get a list of verified and enabled for user selection org-wide email
     * addresses the current running user has access to.  This method will only
     * return up to a fixed number of org-wide email address, so if you have a
     * large number of org-wide addresses accessible to the current user this
     * might not return them all.
     *
     * @throws ServiceException if the user can't query for the necessary
     * records, which also includes records needed to determine which org-wide
     * addresses the user has access to.
     */
    public List<EmailAddress> getOrgWideEmailAddresses() {
        /* OrgWideEmailAddress records are usable by the current user if:
         * 
         * 1) the org-wide email is verified,
         * 2) the org-wide email is marked for "User Selection"
         * 3) the org-wide email is marked for use by all profiles OR the
         *    current user has access to it via their profile or a permission
         *    set.
         *
         * To determine whether a user has access to an org-wide email via
         * their profile or a permission set, the related entities
         * OrgEmailAddressSecurity or SetupEntityAccess can be used
         * respectively.
         */

        try {
            Set<Id> allowedOrgWideIds = new Set<Id>();

            // determine which org-wide addresses are allowed by the current
            // running user's profile.
            for (OrgEmailAddressSecurity oeas : [
                SELECT OrgWideEmailAddressId
                FROM OrgEmailAddressSecurity
                WHERE ParentId = :UserInfo.getProfileId()
                WITH USER_MODE
            ]) {
                allowedOrgWideIds.add(oeas.OrgWideEmailAddressId);
            }

            // determine which org-wide addresses are allowed by any permission
            // set assigned to the current running user.
            for (SetupEntityAccess sea : [
                SELECT SetupEntityId
                FROM SetupEntityAccess
                WHERE SetupEntityType = 'OrgWideEmailAddress'
                AND ParentId IN (
                    SELECT PermissionSetId
                    FROM PermissionSetAssignment
                    WHERE AssigneeId = :UserInfo.getUserId()
                    AND IsActive = true
                )
                WITH USER_MODE
            ]) {
                allowedOrgWideIds.add(sea.SetupEntityId);
            }

            List<EmailAddress> orgWideAddresses = new List<EmailAddress>();

            // query for org-wide addresses available for verified and enabled
            // for user selection org-wide email addresses available to the
            // current running user.
            for (OrgWideEmailAddress owea : [
                SELECT
                    DisplayName,
                    Address
                FROM OrgWideEmailAddress
                WHERE IsVerified = true
                AND Purpose IN (
                    'UserSelection',
                    'UserSelectionAndDefaultNoReply'
                )
                AND (
                    IsAllowAllProfiles = true
                    OR Id IN :allowedOrgWideIds
                )
                WITH USER_MODE
                ORDER BY DisplayName
                LIMIT 50
            ]) {
                orgWideAddresses.add(new EmailAddress(owea));
            }

            return orgWideAddresses;
        } catch (QueryException e) {
            throw new ServiceException(Label.errorInvalidOrgWideAddress, e);
        }
    }

    /**
     * Exception class indicating something went wrong within this service.
     */
    public class ServiceException extends Exception {}
}
