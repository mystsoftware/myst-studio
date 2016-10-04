# Creating a Platform Blueprint

## Overview
Rubicon Red MyST uses a declarative approach to automation, meaning users simply define the **target state** of the Oracle Middleware infrastructure to be deployed; which, at the push of a button, is automatically provisioned by MyST.

Within MyST, the target state is captured in the _“platform definition”_, which is divided into two layers:

* First, the **Platform Blueprint** an environment agnostic specification used to define the platform topology and configuration of your Oracle Middleware. This, provides an abstraction layer over the underlying infrastructure; allowing you to define a single Blueprint for all environments.

* Second, the **Platform Model**, which maps the Platform Blueprint to the target infrastructure and overlays the environment specific configurations.

For each platform instance, we create a separate platform model to define all the environment specific configuration information. Splitting the _“platform definition”_ into two layers, provides infrastructure independence; enabling you to provision consistent middleware platforms across all environments regardless of infrastructure type, on premise and on cloud.

>> **Note:**
Most Oracle Middleware products run on Oracle WebLogic Application Server. WebLogic supports the concept of a Domain to group related clusters and servers. Some organisations use separate domains for each business unit or capability, others use it to group computational workload. How it is used is up to the organisation. For Oracle products that run on WebLogic, a ***Platform Blueprint represents a logical definition of a WebLogic domain***. For this reason it is typical for a separate blueprint to be created in MyST Studio for each unique WebLogic domain type in an enterprise.

There are three ways in which you can create a Platform Blueprint:
* **Wizard:** This guides the user through a simple process to capture the key design decisions for the Oracle Middleware topology and configuration and creates a corresponding Platform Blueprint.
* **Template:** Choose from a set of pre-defined Rubicon Red certified templates to build your blueprints on or use a template that you have created.
* **Introspection:** Use MyST to discover and introspect an existing WebLogic Domain and create a corresponding Platform Blueprint.

## Creating a Platform Blueprint using the Wizard
From the side menu navigate to`Modeling` > `Platform Blueprint`, this will display a list of existing Platform Blueprints. Click on `Create New` in the top right-hand corner of the screen. This will launch the `New Platform Blueprint` wizard.

### Enter Basic Information
Specify the following values:

* **Name** - Short hand name for the Platform Blueprint

* **Description** - A longer description of the Platform Blueprint
* **Workspaces** - This defines the Workspaces to which the Platfrom Blueprint belongs. See Role Based Access Control for further details.
* **Initial Version** - The speficies the initial version of the Platform Blueprint. See Platform Blueprint and Model Versioning for further details.


Finally, we need to specify how we want to create the Platform Blueprint. Keep the default selection of `Wizard`. Then click `Next'.

### Select Oracle Middleware Components
The next step is to select which Oracle Middleware components are to be included within our Platform Blueprint. First step is select the Oracle Middleware Product Catalog in which we are interested, this could be one of:
* Integration and Process Management
* Social Business & Collaboration
* Business Intelligence
* Identity Management

Next we need to specify the Oracle Middleware version (for example 11.1.1.7, 12.1.3, 12.2.1.0, 12.2.1.1). For the specified Oracle Middleware Product Catalog and Version, MyST will list the components that are available to be included within the Platform Blueprint.

DIAGRAM

Finally select the required Oracle Middleware components that you wish to included within your Platform Blueprint. You will notice that MyST will automatically select any mandatory components, for example if you select Oracle B2B, then Oracle SOA Suite will automatically be selected. Then click `Next'.

> Note, each Platform Blueprint can only include components from a single product catalog. Components that are available in multiple Product Catalogs (e.g. Web Services Manager) appear in all the applicable Product Catalogues.

### Select Compute Groups
Within MyST Compute Groups are used to specify the logical topology of your WebLogic Domain


## Creating a Platform Blueprint from a Pre-Defined Template


## Creating a Platform Blueprint from an existing WebLogic Domain

