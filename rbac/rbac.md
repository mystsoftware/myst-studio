# Role Based Access Control
Within an enterprise, there will be multiple users of MyST, performing a variety of roles in a variety of environments from Development through to Production, for example:
* **Middleware Administrator**: Provisioning, operation and administration of Production systems
* **SOA Developer**: Develops and Tests Code on SOA Projects;  responsible for deploying code into DEV and TEST environments.
* **QA Tech Lead**: Provisioning and Configuration of QA Environments, plus the deployment of code into the QA Environments.
* **CI Tool**: Tools such as Jenkins/Hudson, for orchestrating the automated deployment and testing of code in a Continuous Integration Environment.

Within MyST, Role Based Access Control (RBAC) enables us to control what actions can be performed by each user across a number of dimensions, including:
* Actions that a user is able to perform against certain resource types; for example Platform Blueprint, Platform Model, Application Blueprints, etc.
* Environments that a user is allowed to perform those actions in (e.g. DEV, SIT, UAT, Pre-PROD and PROD)
* A MyST Workspace is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users can be assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.



Within MyST, a Role is used to define the type of MyST resources that a user in that role has access to, and the actions that can be performed against the resources, specifically it  will define:
* What actions a user can perform against each resource type, for example Platform Blueprints / Models, Platform Instances, Artifacts, Application Blueprint / Models.
* Where a resource is Environment specific (e.g. DEV, TEST, QA, etc), for example Platform Model / Instance, Application Models;  then the role will define which actions can be performed against each the resource in each environment.
* A separate reserved MyST Administrator Role will be used to manage system specific configurations, for example user and role management, tag management
* A separate reserved MyST Workspace Administrator Role will be used to manage workspace specific configurations, for example defining which users have which roles within a workspace.


## Users  
Each user has an individual account that at a minimum includes a unique login id, username and password. Users can then be assigned to zero, one or more roles; from which they inherit the the corresponding application privileges.

Within MyST, **users** are not assigned permissions directly, but only acquire them through the **role(s)** assigned to them within one or more **workspaces**.

##Roles
A role is a collection of application-related privileges that define what actions a user with that role may perform against each resource type, for example Platform Blueprint, Platform Model, Pre-Existing Infrastructure and so on.

A role can also be environment specific, in that it only grants application-related privileges in specific environments, for example we may allow a SOA Developer to deploy code into the DEV and TEST environments only.

##Workspace
MyST Workspaces are a flexible way to associate users with particular work streams within an organization. These could be project based, for example a SOA Development Project or team based, for example the Middleware Operations team. 

A MyST Workspace is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users can be assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.
    
Note: MyST administrators define roles in MYST. That is, all workspaces have the same roles available to them. Users may have different roles in different workspaces, and a user can be assigned to multiple roles.

##System Specific Roles
With MyST there are a number of **System Specific Roles**, these are:
* System Administrator
* Workspace Administrator
* API User

###System Administrator
Users assigned the **System Administrator** role, are able to perform the following activities:
* User Management
* Role Management
* Workspace Management
* Environments
* Compute Definition

**Note**: MyST has the default `admin` user, which is configured as part of the initial install of MyST. However this role can be deactivated and **System Administrator** privileges assigned to other users(s).

###Workspace Administrator
A Workspace administrator is someone who has been granted the 'Workspace Administrator' role, for a particular workspace, but not necessarily the global 'System Administrator' permission.

This allows a 'System Administrator' to delegate administration of the workspace to one or more users;
* Configure which Users have access to the workspace
* Configure which roles each of those users have within the workspace
* Configure which resources can be shared with other workspaces.

###API User
The MyST REST API (Application Programming Interface) allows third-party applications, for example CI Servers such as Jenkins, a way to connect to and interact with MyST. 

To connect via the REST API, a user account needs to be assigned the system role of `API User`. This will allow you to create an API Key which is used for authentication when connecting via the REST API.