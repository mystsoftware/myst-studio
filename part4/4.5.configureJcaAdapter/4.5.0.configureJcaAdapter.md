## {{ page.title }}

JCA Adapters are configured through deployment plans. MyST Studio has a mechanism for defining a JCA adapter configuration so that it can be used to generate the deployment plan when the platform is automatically provisioned or updated by MyST.

Below is an example of the JCA Adapters that ship out-of-the-box with the SOA Suite in 12c. 

![](img/jcaAdapters.png)

Before these can be used by applications, they need to be configured. This chapter details how JCA Adapter configurations can be added to a Platform Blueprint.

### Add JCA Adapter to Platform Blueprint
To add a new JCA Adapter in the Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JCA Adapters`. 

Click on the `+` icon next to JCA Adapters (outlined in red). This will create a new JCA Adapter, `Jca Adapter - 1` in the example below.

![](img/createJcaAdapterStep1.png)

Select the new JCA Adapter in the tree view, MyST will display its current configuration. Initially, none of its properties will be set. Click `Edit` to put the JCA Adapter into edit mode.

Set the component name to the name JCA Adapter type we want to configure, as shown in the WebLogic console. In the example below (outlined in red), we have set the component name to `DbAdapter`.

![](img/createJcaAdapterStep2.png)

#### Create Adapter Instances
For each instance of a JCA Adapter, we want to configure, we need to add a corresponding instance to our Platform Blueprint. Click on `Add Item` next to the `Instance List` (outlined in red above).

MyST will add a new instance to our JCA Adapter. For each instance we need to provide the following property values:
* **Name** -  Name of the JCA Adapter instance. This is used only for identifying the instance in MyST Studio and is not used for WebLogic.
* **Jndi Name** -  The JNDI name of the adapter instance at runtime
* **Name-Value Parameters** - Contains the name-value properties that are used to configure the JCA Adapter instance.

> An alternative way of creating a new JCA Adapter instance is to select an existing instance, right click on it and select `Clone`.

##### Add Name Value Parameters
The Name-Value parameters are used to define properties that are used to configure the adapter instance. To add a property, click on `Add One` next to `Name-Value Parameters` and add the properties required to configure the JCS Adapter instance.

![](img/createJcaAdapterStep3.png)

> Alternatively, click on `Edit Bulk` to open the property bulk editor

#### Edit JCA Adapter in Platform Blueprint
To edit an existing JCA adapter in the Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JCA Adapters`. Expand this component to see a list of currently defined adapters and select the JCA adapter you wish to edit.

Click `Edit` to put the JCA adapter into edit mode and enter the required values.

#### Delete Data Source from Platform Blueprint
To delete an existing data source from a Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JCA Adapter`. 

Expand this component to see a list of currently defined data sources. Select an existing JCA adapter, right click on it and select `Delete`.

