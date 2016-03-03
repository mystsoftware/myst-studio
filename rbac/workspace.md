# Workspace Management
MyST Workspaces are a flexible way to associate users with particular work streams within an organization. These could be project based, for example a SOA development project or team based, for example the Middleware Operations team. 

A MyST Workspace is a collection of related resources, such as Platform Blueprints, Platform Instances, etc. Users can be assigned one or more roles in a workspace, which will define what actions they can perform against resources within that workspace.
    
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
 
Line of Business
Some organizations (e.g. Eaton) have separate installations of the Oracle Middleware platform for each line of business (LOB), with each LOB having a separate team responsible for designing, provisioning and maintaining its Oracle Middleware platform, for example it may have the following workspaces:
Industrial Platform
Electrical Platform
Corporate Platform
 
Oracle Middleware Technology Type
Some organizations (e.g. Rabobank) have separate teams responsible for designing, provisioning and maintaining its Oracle Middleware platform based on the technology type, for example it may have the following workspaces:
Oracle SOA Platform
Oracle BPM Platform
Oracle WebCenter Platform
Oracle Identity and Access Management Platform
 
Oracle Middleware Projects
Where an organization has multiple Oracle Middleware project, they will create a separate workspace for each project
Cloud Integration Project (CIP)
Supply Chain Project
Mobile Project
 
Note: A resource could belong to multiple Workspaces. For example a DEV Platform Instance may be manged by the Platform Workspace, but still need to belong to the Integration Project workspace - so that developers within that Workspace are still able to perform actions against it.
 
We still need to design the appropriate way of handling this.