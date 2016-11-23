## Overview
Rubicon Red MyST uses a declarative approach to automation, meaning users simply define the **target state** of the Oracle Middleware infrastructure to be deployed; which, at the push of a button, is automatically provisioned by MyST.

Within MyST, the target state is captured in the _“platform definition”_, which is divided into two layers:

* First, the **Platform Blueprint** an environment agnostic specification used to define the platform topology and configuration of your Oracle Middleware. This, provides an abstraction layer over the underlying infrastructure; allowing you to define a single Blueprint for all environments.

* Second, the **Platform Model**, which maps the Platform Blueprint to the target infrastructure and overlays the environment specific configurations.

For each platform instance, we create a separate platform model to define all the environment specific configuration information. This approach provides a number of benefits, including:

* **Consistency** - Configuration across all environments from Development through to Production is managed through a centralised *Platform Blueprint*.
* **Infrastructure Independence** - Enabling you to provision consistent middleware platforms across all environments regardless of infrastructure type, on premise and on cloud
* **Reliability** - Through *automation* MyST will reduce risk by bringing platforms to a desired state no matter what the initial state is of the target platform. This is known as *idempotency* 
* **Flexibility** - Environment-specific overrides can be applied through *Platform Models*, allowing for configuration differences to be safely managed. This is discussed in detail in [a later topic](/intro/lab3/establish-a-demo-environment-model.html) 
* **Governance** - Platform Blueprint and Platform Modles are *version controlled*. Release Pipelines provide complete control in promoting configuration changes across environments. 
* **Simplicity**: Easy to use graphical editor for defining target state of Oracle Middleware configuration. There is no need to write scripts or have specialist skills in a programming language

>> **Note:**
Most Oracle Middleware products run on Oracle WebLogic Application Server. WebLogic supports the concept of a Domain to group related clusters and servers. Some organisations use separate domains for each business unit or capability, others use it to group computational workload. How it is used is up to the organisation. For Oracle products that run on WebLogic, a ***Platform Blueprint represents a logical definition of a WebLogic domain***. For this reason it is typical for a separate blueprint to be created in MyST Studio for each unique WebLogic domain type in an enterprise.

There are three ways in which you can create a Platform Blueprint:
* **Wizard:** This guides the user through a simple process to capture the key design decisions for the Oracle Middleware topology and configuration and creates a corresponding Platform Blueprint.
* **Template:** Choose from a set of pre-defined Rubicon Red certified templates to build your blueprint or use a template that you have previously created.
* **Introspection:** Use MyST to discover and introspect an existing WebLogic Domain and create a corresponding Platform Blueprint.

## Creating a Platform Blueprint using the Wizard
MyST Studio provides a wizard which guides the user through the end-to-end proces of designing your Platform Blueprint. The wizard is used to capture key design decisions, such as:

 * Which Oracle Middleware product, version and components do want in your platform? 
 * What topology do you want? For example, do you want
   * A separate webtier layer?
   * Separate layers per product component?
   * An isolated admin server?
 * What constraints do you want to add to your platform? For example, what is:
   * The minimum and maximum cluster size?
   * The target operating system?
 * What additional platform capabilities do you want to configure? For example:
   * Do you want encrypted listen addresses for your WebLogic Servers?
   * Do you want to persist TLogs and JMS Stores to the database or file system?
   * Do you require GridLink data sources for Oracle Middleware product schemas?

Based on the answers provided, MyST will generate a Oracle EDG Compliant Platform Blueprint which can then be used to install and configure your Oracle Middleware Platform.

### Launching the Platform Blueprint Wizard
From the side menu navigate to`Modeling` > `Platform Blueprint`, this will display a list of existing Platform Blueprints. Click on `Create New` in the top right-hand corner of the screen. This will launch the `New Platform Blueprint` wizard.

![](img/SmartWizardBasic.PNG)
In the initial dialogue we need to specify the following details about our Platform Blueprint:

* **Name** - Short hand name for the Platform Blueprint
* **Description** - A longer description of the Platform Blueprint
* **Workspaces** - This defines the Workspaces to which the Platfrom Blueprint belongs. See Role Based Access Control for further details.
* **Initial Version** - The speficies the initial version of the Platform Blueprint. See Platform Blueprint and Model Versioning for further details.


Finally, we need to specify how we want to create the Platform Blueprint. Keep the default selection of `Wizard`. Then click `Next`.

### Specify Oracle Middleware Components
The next stage is to select which Oracle Middleware components are to be included within our Platform Blueprint. First, select the Oracle Middleware Product Catalog in which we are interested, this could be one of:
* Integration and Process Management
* Social Business & Collaboration
* Business Intelligence
* Identity Management

Next specify the Oracle Middleware version (for example 11.1.1.7, 12.1.3, 12.2.1.0, 12.2.1.1). For the specified Oracle Middleware Product Catalog and Version, MyST will list the components that are available to be included within the Platform Blueprint.

![](img/SmartWizardComponents.PNG)

Finally select the required Oracle Middleware components to be included within your Platform Blueprint. You will notice, MyST automatically selects any mandatory components, for example if you select Oracle B2B, then Oracle SOA Suite will automatically be selected. 

> Note, each Platform Blueprint can only include components from a single product catalog. Components that are available in multiple Product Catalogs (e.g. Web Services Manager) appear in all the applicable Product Catalogues.

Once all components have been specified, click `Next`.

### Specify Compute Groups

#### Introduction to Compute Groups
Within MyST Compute Groups are used to specify the logical topology of our WebLogic Domain.

When we layout out our WebLogic Domain, its common to target different component types, such as the Web Tier, Oracle Service Bus and Oracle SOA to different  groups of virtual or physical servers.  

For example in Production, we could have a WebLogic Domain consisting of four Oracle Service Bus managed servers, two SOA managed servers and a web-tier consisting of two Oracle HTTP servers.  

It is also common for Non Production environments, such as Continuous Integration (CI), System Integration Testing (SIT) and Pre-Production (PRE) to vary in size. For example we may have a 4 node OSB cluster in Prod and Pre-Prod, with a two node OSB cluster in UAT and SIT and just a single node OSB and SOA (cluster) for CI.  

As we have already mentioned, a core objective of MyST is to enable you to use a single Platform Blueprint for all these environments, so we can ensure that each of these environments has an identical configuration and prevent issues caused by configuration drift.  

Compute groups in MyST allow us to specify the rules to target component types to specific groups of servers, as well as specify the default, minimum and maximum number of nodes in the compute group.  With the actual number of nodes in the compute group being specified as part of the Platform Model, but within the constraints specified by the Platform Blueprint. This provides the flexibility required to use a single Platform Blueprint across all environments.  

The other consideration when specifying our domain topology, is whether to have a standalone admin node, in other words deploy it to its own compute group, or include it within an existing compute group.  

As the admin server cannot be clustered, when selecting a standalone admin node, MyST will set the maximum number of nodes to one. When including it within an existing compute group, MyST will only provision the admin server to the first node in the compute group.

> Note: If you select a standalone admin server in the Platform Blueprint, you still have the option of overriding this in the Platform Model. This provides an additional level of flexibility, as you may want a standalone admin server in Production, but to co-locate it with another managed server in some environments in order to save resources. 

#### Define Compute Group
To define the compute groups that we want in our Platfrom Blueprint, we first need to specify the following values:

* **Standalone Admin Node** - From the drop down, select whether you want to have a standalone admin server (`Yes`) or include it within an existing compute group (`No`)
* **Number of Compute Groups** - From the drop down, select the required number of compute groups.

![](img/SmartWizardComputeGroups.PNG)

For each Compute Group, we need to specify the following values:
* **Name** - Provide a short name (such as web, soa, osb) for the Compute Group.
* **Components** - Click on the appropriate check boxes to add the required components to a compute group. Note: A component can only belong to a single Compute Group, so by selecting it for one Compute Group, will automatically deselect it from it's previous Compute Group.
* **Node Constraints** - Specify the default, minimum and maximum number of nodes in the compute group. When creating a Platform Model, it will use the default value for the number of nodes, this can then be modified with the minimum and maximum constraints.

Finally, we need to select from the drop down the target compute definition for all target hosts that will be used within each compute group.

Once done, click `Next`.

### Specify Other Key Configurations
The final stage is to specify a number of other key configuration decisions for the Platform Blueprint. 

![](img/SmartWizardOther.PNG)

MyST will default these options based on the most common configurations, we should update these details as required for our Platform Blueprint. These are:

* **WebLogic Domain Name** - Specify an appropriate WebLogic Domain Name.
* **Enable Standard Listen Ports** - This option is selected by default and can only be disable if you enable SSL Listen Ports.
* **Enable SSL Listen Ports** - Select this option to enable SSL listen ports for the WebLogic Servers in the domain.
* **Enable Administration Port** - Select this option to enable the SSL administration port for  all WebLogic Servers in the domain.
* **Administration Port** - Specify the port no for the SSL administration port (can only be set if the Administration Port is enabled).
* **JDBC Data Source Type** - This option is used to specify the Data Source Type for Oracle Middleware specific schemas which are created by the Oracle Middleware Repository Creation Utility (RCU). If using Oracle RAC, then select a GridLink Data Source otherwise use a Generic Data Source.
* **Persistence Strategy** - Use this to specify whether TLOG's and JMS Stores are held on the File System or in the Database.

Once done, click `Next`.

### Review the Summary
MyST will display a Summary screen showing all the keys inputs specified in the Platform Blueprint Wizard. 

![](img/SmartWizardSummary.PNG)

Once done, click `Finish`. MyST will create the corresponding Platform Blueprint and take you to the Platform Blueprint Editor where you can make additional changes if required. See Editing Platform Blueprints for further details.

## Creating a Platform Blueprint from a Pre-Defined Template
MyST comes with a catalogue of certified Platform Templates, with _"built-in"_ best practice for enterprise deployment of Oracle Middleware. We can use these to create our initial Platform Blueprint.

MyST also allows us to [create our own Platform Templates](tbd), which can be used to create our initial Platform Blueprint. This can be useful if we have multiple domains in Production for the same Product Components. For example, we may have multiple SOA domains each designated to a particular line of business. Platform Templates allows us to capture a base "Platform Blueprint" that can be re-used to create the Platform Blueprint for each domains.

### Launching the Platform Blueprint Wizard
From the side menu navigate to`Modeling` > `Platform Blueprint`, this will display a list of existing Platform Blueprints. Click on `Create New` in the top right-hand corner of the screen. This will launch the `New Platform Blueprint` wizard.

![](img/TemplateBasic.PNG)

In the initial screen we need to specify the following details about our Platform Blueprint:

* **Name** - Short hand name for the Platform Blueprint
* **Description** - A longer description of the Platform Blueprint
* **Workspaces** - This defines the Workspaces to which the Platfrom Blueprint belongs. See Role Based Access Control for further details.
* **Initial Version** - The speficies the initial version of the Platform Blueprint. See Platform Blueprint and Model Versioning for further details.

Finally, we need to specify we want to use a **template **to create the Platform Blueprint. Select `Template`and click `Next`.

### Select Template
The next stage is to select which template to use for our Platform Blueprint. 

![](img/TemplateSelect.PNG)

From the drop-down, select the required Platform Template. MyST will display the Platform Template decription, allowing you to verify that the correct template has been selected. Once selected, click `Next`.

### Review the Summary

MyST will display a Summary screen showing all the keys inputs specified in the Platform Blueprint Wizard.

![](img/TemplateSummary.PNG)

Once done, click `Finish`. MyST will create the corresponding Platform Blueprint and take you to the Platform Blueprint Editor where you can make additional changes if required. See Editing Platform Blueprints for further details.

<!-- ## Creating a Platform Blueprint from an existing WebLogic Domain -->

