# Role Based Access Control

There are three key elements for managing users, these are:

### Users  
Each user has an individual account that at a minimum includes a unique login id, username and password.
Users can then be assigned to zero, one or more roles; from which they inherit the the corresponding application privileges.

* **System Administrator** - MyST administrators define roles in MYST — that is, all workspaces have the same roles available to them.
* **Workspace Administrator**
* **API User**

 
###Role  
A role is a collection of application-related privileges. Users may have different roles in different workspaces, and a user can be assigned to multiple roles.
 
###Workspace
MyST Workspaces are a flexible way to associate users with particular workstreams within an organisation. These could be project based (e.g a SOA Development Project) or activity based (e.g. Middleware Operations). 

A MyST Workspaces is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users will be assigned a assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.
    
Workspaces also allow for delegated administration:
    * MyST administrators define roles in MYST — that is, all workspaces have the same roles available to them.
    * Workspace administrators assign members to roles specifically for their workspace(s).
    * A Workspace administrator is someone who has the project-specific 'Administer Workspace' permission, but not necessarily the global 'MyST Administrator' permission.