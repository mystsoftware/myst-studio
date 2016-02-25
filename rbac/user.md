# User Management

Each user has an individual account that at a minimum includes a unique login id, username and password. Users can then be assigned to zero, one or more groups; from which they inherit the the corresponding application privileges.



## List Users
To see a list of MyST Users, click  `Administration` > `Users`. This will display a list of Users similar to the one below.

![](img/UserList.PNG)

The list can be filtered / sorted by User Name or Status, by entering the filter criteria in the filter fields (outlined in red in the above screen-shot)/

## Creating a New User
Click `+ Create User`, this will open the **Add User** dialogue. Specify the following values:

* **First Name** - First name of the user
* **Last Name** - Last name of the user
* **EMail Address** - Users email address
* **Username** - Username for the account, can only consist of alphanumeric, period and underscore characters. Must be unique within MyST.
* **Password** - User Password
* **System Specific Roles** - To assign the user System Admin status, enable the `System Administrator` check-box.

![](img/UserAdd.PNG)


Click `Create` to Save the create the User Account. Once saved the user will be able to login into MyST with the provided username and password. 

**Note**: At this point the user will not have any privileges to perform any actions within MyST.

## Edit User Account
To edit the user account; click on the `Edit` button for the corresponding User, this will open the **Edit User** dialogue.

Here you can modify the First Name, Last Name, Email Address and System Specific Roles of the User. Once done, click `Save` to confirm your changes.

### Change User Password
To reset the user password, from within the Edit User dialogue, click `Change Password`,  this will open the **Change Password** dialogue. Enter the new password and click `Change Password` to confirm.

### Change Username
To change the username, from within the Edit User dialogue, click `Change Username`,  this will open the **Change Username** dialogue. Enter the new username and click `Change username` to confirm.

## Activate / Deactivate User
By default, when you create a User, it is in an active state. Meaning that the user is able to log into MyST and perform any actions for which they have been granted privileges.

To prevent any new resources being tagged to an Environment, we can deactivate the Environment Type.

**Note**: 
* Deactivating an existing environment type does not affect resources that are currently mapped to the environment type.
* A deactivated Environment Type can be reactivated at any time.

To deactivate an environment; click on the  **Actions** drop-down menu for the corresponding Environment Type and select `Deactivate` as illustrated below.

![](img/EnvironmentTypeDeactivate.PNG)

To activate a deactivated environment; click on the  **Actions** drop-down menu for the corresponding Environment Type and select `Activate`.