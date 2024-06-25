static final String VOLUNTEERS_APP_NAME = 'Volunteers';

public static void setVolunteersAppToFirst() {
    List<UserAppMenuItem> appMenuItems = [SELECT ApplicationId, Name FROM UserAppMenuItem ORDER BY SortOrder];
    List<Id> orderedIds = new List<Id>();
    Boolean firstItem = true;
    for (UserAppMenuItem item : appMenuItems) {
        if (item.Name == VOLUNTEERS_APP_NAME) {
            if (firstItem) {
                return;
            }
            orderedIds.add(0, item.ApplicationId);
        } else {
            orderedIds.add(item.ApplicationId);
        }
        firstItem = false;
    }
    AppLauncher.AppMenu.setOrgSortOrder(orderedIds);
}