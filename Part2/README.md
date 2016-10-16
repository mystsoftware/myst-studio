# Part 2 - Infrastructure Management
Before we can provision our Oracle Middleware platform, we need to ensure that the pre-requisite  infrastructure that will host our middleware platform, including load balancers, the compute nodes that will host our Oracle Middleware servers and the database that will hold the Oracle Middleware Schemas.

As part of the configuration of MyST we need to define the **Infrastructure Provider(s)** and their corresponding compute nodes and in which environments (for example DEV, SIT, UAT and PROD). 


During the lifetime of a project, code will be built and promoted to various staging environments, such as Development (DEV), System Integration Testing (SIT), User Acceptance Testing (UAT), Pre-Production (PRE), and Production (PROD).

**Environment Types** are designed to help categorise Oracle Middleware Platform Instances for governance purposes. This categorisation can help to manage who has access to instances, and what type of actions they can perform against the instance

Compute Definitions are used to indicate operating system requirements for target hosts in MyST Studio. When, we create a Platform Blueprint, we need to specify its Compute Definition. This is used to define the operating system requirements for target servers (i.e Virtual or Bare Metal) that will be used by any Platform Model based on the Platform Blueprint.

When provisioning Platform Instances from a Blueprint on pre-existing target hosts, the Compute Definition tells MyST how it should interact with target hosts. For example, if the Compute Definition is for Solaris then MyST will know to treat the platform as if it is Solaris instead of say Oracle Linux.

MyST supports two types of infrastructure providers:
* **Pre-existing**: Any existing bare-metal, virtualization (such as VMWare, OVM), or cloud providers (such as Oracle, AWS or Azure), that you want to add and use with MyST Studio.
* **On Demand (AWS)**: Any new AWS infrastructure, that you want to use with MyST Studio. MyST Studio creates compute instances using your AWS account and provisions the Oracle Fusion Middleware to these instances.

This part contains the following chapters:

* [Chapter 2.1 - Environment Types](Part2/environmentTypes/environmentTypes.md)
* [Chapter 2.2 - Middleware Hosts](Part2/middlewareHosts/middlewareHosts.md)
* [Chapter 2.3 - Compute Definitions](Part2/computeDefinitions/computeDefinitions.md)
* [Chapter 2.4 - Configuring Pre-Existing Infrastructure](Part2/preExistingInfrastructure/PreExistingInfrastrcutureProvider.md)
* [Chapter 2.5 - Configuring AWS On-Demand Infrastructure](Part2/awsOnDemand/AwsOnDemand.md)

