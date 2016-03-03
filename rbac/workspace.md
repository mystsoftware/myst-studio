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
