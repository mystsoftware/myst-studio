# Workspace Management

MyST Workspaces are a flexible way to associate users with particular work streams within an organization. These could be project based, for example a SOA development project or team based, for example the Middleware Operations team. 

A MyST Workspace is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users can be assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.


Within MyST, a Role is used to define the type of MyST resources that a user in that role has access to, and the actions that can be performed against the resources, specifically it  will define:
* What actions a user can perform against each resource type, 
* Where a resource is Environment specific (e.g. DEV, TEST, QA, etc), for example Platform Model / Instance, Application Models;  then the role will define which actions can be performed against each the resource in each environment.
* A separate reserved MyST Administrator Role will be used to manage system specific configurations, for example user and role management, tag management
* A separate reserved MyST Workspace Administrator Role will be used to manage workspace specific configurations, for example defining which users have which roles within a workspace.


    
MyST administrators define roles in MYST. That is, all workspaces have the same roles available to them. Users may have different roles in different workspaces, and a user can be assigned to multiple roles within a workspace.


RBAC will provide workspaces which are containers for related resources (for example the SOA Platform could be the workspace for Platform Blueprints, Platform Models and Instances that make up the SOA Platform).
 
For each Workspace, MyST will allow you to configure:
Which users have access to a workspace, and what role(s) they are able to perform in that workspace.
The role defines what actions a user can perform against each resource type (for resources contained within the Workspace)
Where a resource is mapped to an environment (for example a Platform Model or Platform Instance to a DEV environment) then the role will define which actions can be performed against that resource in each environment (for example DEV, TEST, PROD).
A user may belong to multiple workspaces.
 
When creating a resource with a Parent resource (e.g. Platform Model has a Platform Blueprint), then by default the Platform Model will automatically be added to the workspaces of its Parent.
 
It is envisaged that organizations will use Workspaces in multiple ways, based on how they structure the delivery of work, for example:

It is envisaged that organizations will use Workspaces in multiple ways, based on how they structure the delivery of work, for example:

Each user has an individual account that at a minimum includes a unique login id, username and password. 

Within MyST, **users** are not assigned permissions directly, but only acquire them through the **role(s)** assigned to them within one or more **workspaces**. 

Users can also be assigned System Roles, which will enable them to manage system specific configurations.

## List Workspaces
To see a list of MyST Workspaces, click  `Administration` > `Workspaces`. This will display a tiled view of Workspaces similar to the one below.

![](img/WorkspaceList.PNG)
For each workspace, MyST provides summary of the number of resources contained in the workspace, including:
* Users
* Platform Templates
* Platform Blueprints
* Platform Models
* Platform Instance
* Infrastructure Providers


## Creating a New Workspace
Click `+ Create Workspace`, this will open the **Add Workspace** dialogue. Specify the following values:

* **Name:** Name of the Workspace
* **Description:** Description of the Workspace

Click `Save` to create the Workspace. Once saved the user will be able to login into MyST with the provided username and password. 

**Note**: At this point the user will not have any privileges to perform any actions within MyST.

## Configure Users
To configure workspace users; click on the click on the  **Actions** drop-down menu for the corresponding Workspace and select `Configure Users`, this will open the **Configure Users** dialogue.

###Add User
To add a new user to the Workspace, 

### Associate Resources
To change the username, from within the Edit User dialogue, click `Change Username`,  this will open the **Change Username** dialogue. Enter the new username and click `Change username` to confirm.

## Edit Workspace
To edit a workspace; click on the click on the  **Actions** drop-down menu for the corresponding Workspace and select `Open`, this will open the **Edit Workspace** dialogue.

Here you can modify the Name and Description of the Workspace. Once done, click `Save` to confirm your changes.

## Activate / Deactivate User
By default, when you create a User, it is in an active state. Meaning that the user is able to log into MyST and perform any actions for which they have been granted privileges.

To disable access to MyST, we can deactivate the User Account.

**Note**: 
* Deactivating a User account does not remove any workspaces roles they have been granted, but prevents them from logging in and performing any of those roles.
* A deactivated User account can be reactivated at any time.

To deactivate a User account; click on the  **Actions** drop-down menu for the corresponding User and select `Deactivate` as illustrated below.

![](img/UserDeactivate.PNG)

To activate a deactivated environment; click on the  **Actions** drop-down menu for the corresponding User account and select `Activate`.

## Delete User
To delete a User account; click on the  **Actions** drop-down menu for the corresponding User and select `Delete`. We will be prompted to confirm out action, click `Yes` to proceed.

When deleted the user will be removed from any workspaces to which they belong.
