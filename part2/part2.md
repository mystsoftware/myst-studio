# Part 2 - Infrastructure Management
Within MyST, **Hosts** are the logical representation of the Virtual, Physical, Container or Cloud based servers that host the Oracle Middleware Server instances that make up our Oracle Middleware Platform.

MyST allows the use of pre-existing hosts on-premise and in the cloud (for example Oracle Cloud, Amazon Web Services and Azure). In addition for some cloud environments, MyST suppports the creation of cloud based hosts on-demand.

Each host in MyST has a corresponding **Compute Definition**, is associated with an **Infrastructure Providers**, and is tagged to one or more **Environment Types**.

#### Infrastructure Provider
An Infrastructure Provider typically maps to a data center or a cloud provider region. MyST supports two types of infrastructure providers:

* **Pre-Existing**: A Pre-Existing infrastructure provider is one where the hosts onto which the Oracle Middleware will be provisioned has been set-up and configured externally to MyST. Can be used with any existing bare-metal, virtual machines (such as VMWare, Oracle VM), or cloud providers (such as Oracle Cloud, AWS or Azure) that we want to use as the target for hosting our Oracle Middleware platforms. 
* **On Demand (AWS)**: An On-Demand (AWS) infrastructure provider is one where hosts onto which the Oracle Middleware will be created on-demand as part of the process of provisioning the Oracle Middleware platform. This approach relies upon an Amazon Machine Image which is used as a template for the Virtual Machines that are created to underpin the Oracle Middleware platforms.

#### Environment Types
Environment Types, are typically aligned to software delivery lifecycle (for example DEV, SIT, UAT and PROD) and are designed to help categorise Oracle Middleware Platform Instances for governance purposes. This categorisation can help to manage who has access to instances, and what type of actions they can perform against the instance. It also prevents

#### Compute Definitions
Compute Definitions are used to indicate operating system requirements for hosts. When, we create a Platform Blueprint, we need to specify its Compute Definition. This is used to define the operating system requirements for target host as well as how MyST should interact with the host. For example, if the Compute Definition is for Solaris then MyST will know to treat the platform as if it is Solaris instead of say Oracle Linux.

This part contains the following chapters:

* [Chapter 2.1 - Environment Types](Part2/environmentTypes/environmentTypes.md)
* [Chapter 2.2 - Compute Definitions](Part2/computeDefinitions/computeDefinitions.md)
* [Chapter 2.3 - Configuring Pre-Existing Infrastructure](Part2/preExistingInfrastructure/PreExistingInfrastrcutureProvider.md)
* [Chapter 2.4 - Configuring AWS On-Demand Infrastructure](Part2/awsOnDemand/AwsOnDemand.md)
* [Chapter 2.5 - Middleware Host Prerequisites](Part2/middlewareHosts/middlewareHosts.md)


