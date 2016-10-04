# Overview
Before we can provision a Platform Instance based on a Platform Blueprint, we need to define a Platform Model. 

The Platform Model maps the Platform Blueprint to the target environment for our Oracle Middleware platform and provides environment specific configuration details. The target environment can be on premise or on the cloud.

When we create the Platform Model, we also have the ability to override many of the configurations defined in the Platform Blueprint, this provides a mechanism to safely manage configuration differences between environments. For example, you may want for detailed logging levels in a Development or Test environment.

For each Platform Instance that we want to create, we need to create a corresponding Platform Model in MyST.

## Creating a Platform Model
From the side menu navigate to`Modeling` > `Platform Model`, this will display a list of existing Platform Models. Click on `Create New` in the top right-hand corner of the screen. This will launch the `New Platform Model` wizard.

![](img/SmartWizardBasic.PNG)

In the initial dialogue we need to specify the following details about our Platform Model:

* **Platform Blueprint** - The Platform Blueprint that we will use for our Platform Model.
* **Platform Blueprint Version** - The version of the Platform Blueprint that we will use for our Platform Model.
* **Environment Type** - The Environment Type for the Platform Model.
* **Name** - Short hand name for the Platform Blueprint.
* **Description** - A longer description of the Platform Model.

* **Workspaces** - This defines the Workspaces to which the Platform Model belongs. See Role Based Access Control for further details.

>> Note: MyST will set the initial version of the Platform Model to 
`<Platform Blueprint Version>-1`. See Platform Blueprint and Model Versioning for further details.

Once we have entered the basic details about our Platform Model click `Next`.

### Select Infrastructure Provider

### Map