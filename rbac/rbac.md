# Role Based Access Control
Within an enterprise, there will be multiple users of MyST, performing a variety of roles in a variety of environments from Development through to Production, for example:
* **Middleware Administrator**: Provisioning, operation and administration of Production systems
* **SOA Developer**: Develops and Tests Code on SOA Projects;  responsible for deploying code into DEV and TEST environments.
* **QA Tech Lead**: Provisioning and Configuration of QA Environments, plus the deployment of code into the QA Environments.
* **CI Tool**: Tools such as Jenkins/Hudson, for orchestrating the automated deployment and testing of code in a Continuous Integration Environment.

Within MyST, Role Based Access Control (RBAC) enables us to control what actions can be performed by each user across a number of dimensions, including:
* Actions that a user is able to perform against certain resource types; for example Platform Blueprint, Platform Model, Application Blueprints, etc.
* Environments that a user is allowed to perform those actions in (e.g. DEV, SIT, UAT, Pre-PROD and PROD)
* Certain "workspaces" that a user is allowed to work on (e.g. SOA Project A, ADF Project B).
Administration type duties, e.g. define Environments, Infrastructure, etc


Within MyST, users are not assigned permissions directly, but only acquire them through the role(s) assigned to them within a workspace.

A role is a collection of application-related privileges. Users may have different roles in different workspaces, and a user can be assigned to multiple roles.
 
A role is also environment specific, in that it only grants application-related privileges in specific environment, for example we may allow a SOA Developer to deploy code into the DEV and TEST environments only.

management of individual user rights becomes a matter of simply assigning appropriate roles to the user's account; this simplifies common operations, such as adding a user, or changing a user's department.


Within MyST, roles are created for various job functions.

Users (or other system users) are assigned particular roles, 


and through those role assignments acquire the computer permissions to perform particular computer-system functions. 





There are three key elements for managing users, these are:

### Users  
Each user has an individual account that at a minimum includes a unique login id, username and password.
Users can then be assigned to zero, one or more roles; from which they inherit the the corresponding application privileges.

* **System Administrator** - MyST administrators define roles in MYST — that is, all workspaces have the same roles available to them.
* **Workspace Administrator**
* **API User**

 
###Role  

###Workspace
MyST Workspaces are a flexible way to associate users with particular workstreams within an organisation. These could be project based (e.g a SOA Development Project) or activity based (e.g. Middleware Operations). 

A MyST Workspaces is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users will be assigned a assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.
    
Workspaces also allow for delegated administration:
    * MyST administrators define roles in MYST — that is, all workspaces have the same roles available to them.
    * Workspace administrators assign members to roles specifically for their workspace(s).
    * A Workspace administrator is someone who has the project-specific 'Administer Workspace' permission, but not necessarily the global 'MyST Administrator' permission.
    
    
    
    Within MyST, a Role is used to define the type of MyST resources that a user in that role has access to, and the actions that can be performed against the resources, specifically it  will define:
* What actions a user can perform against each resource type, for example Platform Blueprints / Models, Platform Instances, Artifacts, Application Blueprint / Models.
* Where a resource is Environment specific (e.g. DEV, TEST, QA, etc), for example Platform Model / Instance, Application Models;  then the role will define which actions can be performed against each the resource in each environment.
* A separate reserved MyST Administrator Role will be used to manage system specific configurations, for example user and role management, tag management
* A separate reserved MyST Workspace Administrator Role will be used to manage workspace specific configurations, for example defining which users have which roles within a workspace.