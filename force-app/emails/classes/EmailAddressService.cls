/**
 * This service class provides methods for retrieving email addresses that are
 * configured or defined in the org, including the current running user's email
 * address or org-wide email addresses which are accessible by the current
 * running user.
*/
public with sharing class EmailAddressService {
    /**
     * Get the current running user's email address (and display name).  This
     * will return either the customized sender name and/or email as configured
     * via user's email settings, or the user's email and name (i.e. the values
     * which are used when sending emails as the current user), in addition to
     * whether the email address is "verified".
     */
    public EmailAddress getCurrentUserEmailAddress() {
        Id userId = UserInfo.getUserId();

        // Users can configure their sending name and email address to be
        // different from their user name and email address via their personal
        // settings > My Email Settings.  If they specify a different sender
        // email address, this address is only saved and made available to be
        // used *after* it is verified by the user.  Here, we choose to use the
        // user's configured sender name and email if they are populated,
        // otherwise we fall back to the user's name and email address.
        User u = [
            SELECT
                Email,
                Name,
                SenderEmail,
                SenderName
            FROM User
            WHERE Id = :userId
            WITH USER_MODE
            LIMIT 1
        ];

        String senderName = u.SenderName;

        if (String.isBlank(senderName)) {
            senderName = u.Name;
        }

        String senderEmail = u.SenderEmail;
        // custom sender address is always a verified address.
        Boolean isVerified = true;

        if (String.isBlank(senderEmail)) {
            // Since we aren't using a custom sender email address, then we
            // will fall back to using the user's email address.  In this case,
            // we query the TwoFactorMethodsInfo object to determine if the
            // user's email address is verified or not.
            //
            // Note that this query is NOT done in user mode nor is CRUD or FLS
            // enforced here, because normally querying this object requires
            // the "Manage Multi-Factor Authentication in API" which in turn
            // requires the "Manage Users" permission, which is excessive for
            // simply determing if a user's own email address is verified or
            // not.  We intentionally choose not to enforce CRUD/FLS here
            // because the current running user should always have access to
            // information about whether their email address is verified or
            // not.
            senderEmail = u.Email;
            TwoFactorMethodsInfo userTwoFactorInfo = [
                SELECT HasUserVerifiedEmailAddress
                FROM TwoFactorMethodsInfo
                WHERE UserId = :userId
                LIMIT 1
            ];
            isVerified = userTwoFactorInfo.HasUserVerifiedEmailAddress;
        }

        return new EmailAddress(
            userId,
            senderName,
            senderEmail,
            isVerified
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
                    Address,
                    IsVerified
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
