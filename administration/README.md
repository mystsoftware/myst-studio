# {{ page.title }}

Within an enterprise, there will be multiple users of MyST, performing a variety of roles in a variety of environments from Development through to Production.For example:
* **Middleware Administrator:** Provisioning, operation and administration of Production systems
* **SOA Developer:** Development and testing of code on SOA projects;  responsible for deploying code into DEV and TEST environments.
* **QA Tech Lead:** Provisioning and configuration of QA environments, plus the deployment of code into the QA environment.
* **CI Tool:** Tools such as Jenkins/Hudson, for orchestrating the automated deployment and testing of code in a Continuous Integration Environment.

Within MyST, Role-Based Access Control (RBAC) enables us to control what resources a user has access to, and what actions they can perform across a number of dimensions, including:

* What actions a user can perform against each resource type, for example, Platform Blueprint, Platform Model, Application Blueprints, etc.
* Environments that a user is allowed to perform those actions in, for example, DEV, SIT, UAT, Pre-PROD, and PROD.

## Users  
Each user has an individual account that at a minimum includes a unique login id, username, and password. 

Within MyST, **users** are not assigned permissions directly, but only acquire them through the **role(s)** assigned to them within one or more **workspaces**. 

Users can also be assigned System Roles, which will enable them to manage system specific configurations.

## Roles
A role is a collection of application-related privileges that define what actions a user with that role may perform against each resource type, for example, Platform Blueprint, Platform Model, Pre-Existing Infrastructure and so on.

A role can also be environment specific, in that it only grants application-related privileges in specific environments. For example, we may allow a SOA Developer to deploy code into the DEV and TEST environments only.

## Workspace
MyST Workspaces are a flexible way to associate users with particular work streams within an organization. These could be project based, for example a SOA development project, or team based, for example, the Middleware Operations team. 

A MyST Workspace is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users can be assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.
    
MyST administrators define roles in MYST. That is, all workspaces have the same roles available to them. Users may have different roles in different workspaces, and a user can be assigned to multiple roles within a workspace.

## System Roles
With MyST there are a number of System Roles, these are:
* System Administrator
* Workspace Administrator
* API User

### System Administrator
A separate reserved **System Administrator** role is used to manage system specific configurations, including:
* User Management
* Role Management
* Workspace Management
* Environments
* Compute Definitions

**Note**: MyST has the default `admin` user, which is configured as part of the initial install of MyST. However, this user can be deactivated and/or **System Administrator** privileges can be assigned to other users.

### Workspace Administrator
A Workspace administrator is someone who has been granted the `Workspace Administrator` role for a particular workspace, but not necessarily the global 'System Administrator' permission.

This allows a `System Administrator` to delegate administration of the workspace to one or more users, this includes:
* Configure which Users have access to the workspace
* Configure which roles each of those users have within the workspace
* Configure which resources can be shared with other workspaces.

### API User
The MyST REST API (Application Programming Interface) provides third-party applications, for example, CI Servers such as Jenkins, with a way of connecting to and interacting with MyST. 

To connect via the REST API, a user account needs to be assigned the system role of `API User`. This will allow you to create an API Key which is used for authentication when connecting via the REST API.

This part contains the following chapters:

* [User Management](/administration/users/README.md)
* [Role Management](/administration/roles/README.md)
* [Workspace Management](/administration/workspaces/README.md)
