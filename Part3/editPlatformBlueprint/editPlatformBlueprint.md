## Launching the Platform Blueprint Editor

From the side menu navigate to`Modeling` > `Platform Blueprint`, this will display a list of existing Platform Blueprints. Click on `Actions` drop-down in the top right-hand corner of the Platform Blueprint we want to view or edit and select `Open`. This will launch the `Platform Blueprint Editor` in view only mode.

![](/Part3/editPlatformBlueprint/img/PlatformBlueprintEditor.PNG)

The Platform Editor is split into four core sections:

1. **Control Bar** - Displays the version, revison and state of the Platform Blueprint you are viewing, plus allows you to perform actions such as editing against the Platform Blueprint.
2. **Tree View** - Displays a hierarchical view of the Platform Blueprint. Each element (or branch) can have a number sub-elements, clicking on the plus sign (![](/Part3/editPlatformBlueprint/img/PlatformBlueprintExpand.png)) of an element will expand it to show its sub-components. Clicking on a child element will display the list of properties and values defined for that element in the properties view. 
3. **Topology View** - Helps to visualize the configuration that is defined in the blueprint. We can click on any element in the topology diagram, and view the list of properties defined for that element in the properties view.
4. **Property View** - Displays the list of properties and corresponding values defined for the selected element in your Platform Blueprint. 

You can re-size each view by dragging the grey bars which seperate each section. By clicking on appropriate arrow you can close / open the corresponding view.

### Control Bar

### Tree View - 
The Tree View provides a hierarchical view of the Platform Blueprint.
* **Global Variables** - Propeties that
* **Middleware Settings** - 
* **Products** - This contains an element for each 
* **Compute Groups**
* **Load Balancers**
* **WebTier Configuration**
* **WebLogic Domain**- Used to define the properties for the WebLogic domain (See
* **Keystores**

#### WebLogic Domain Element
* **Admin Server** - 
* **WebLogic Clusters** - 
* **JDBC Data Sources** - 
* **JMS Servers** - 
* **JMS Modules** -
* **JCA Adapters** - 
* **Persistence Stores** - 
* **Security Configuration**
* **Startup & Shutdown Classes**
* **Mail Sessions**
* **WebLogic Deployment Targeting**

### Topology View
The toplogy view provides a summary visualization of your Platform Blueprint and provides a quick short cut for referencing key property values. Specifically, it displays:
* **Load Balancer** - Clicking on this will select the LoadBalancer element in the Platform Blueprint; located at `Blueprint > Load Balancers > LoadBalancer` and display it corresponding properties in the Property View.
* **Compute Groups** - The toplogy view shows each Compute Group and the components it contains. Clicking on a Compute Group will select the corresponding Compute Group element in the Platform Blueprint; located at `Blueprint > Compute Groups > [Compute Group Name]` and display it corresponding properties in the Property View.
* **Component Clusters** - The toplogy view shows each WebLogic Cluster and the corresponding Product Component. Clicking on a WebLogic Cluster will select the corresponding element in the Platform Blueprint; located at `Blueprint > WebLogic Domains > [domain_name] > WebLogic Clusters > [Cluster Name] ` and display it corresponding properties in the Property View.
* **Product Component** - Clicking on a Product Component will select the corresponding element in the Platform Blueprint; located at `Blueprint > Products > [component_name]` and display it corresponding properties in the Property View.

### Property View
On the Blueprints details screen, you will see all the properties and values for the components you select. Some of the properties are auto-computed by MyST Studio, and are highlighted in green. To edit the blueprint configuration, click Edit Configuration. Select the components where you want to make changes, click Edit, make the required updates and click Save. Saving changes at the component level only saves the changes locally. You can make all the changes you need to the blueprint, and apply them at once by clicking Apply Changes to apply all the saved changes, or Discard to discard all the saved changes. Every time you apply changes to a blueprint version, a new revision is created of the blueprint. You can only view the latest revision of the blueprint. However, if the latest revision of the blueprint is not the same as the revision used to provision an instance, you will need to update the instance from the Platform Model or Platform Instances page.

Auto computed values are shown in green
If the user changes it and applies that too will be shown in white

## Understanding MyST Properties
Explain the need for properties

For example, the property `oracle.base` defines the base directory for installing the Oracle Middleware Platform. We also want to define the Oracle Universal Installer Inventory Directory, which is held in the property `oui.inventory.directory`. The default for this is to place this in the sub-directory `inventory' under the Oracle Home.



<!-- Document for Sushil https://rubiconred.jiveon.com/docs/DOC-2384-->
The MyST expression language allows you to refer to any property within the Platform Blueprint and use that property value in defining the value for other properties. 



SO essentially when setting the value of the Global Variable oui.inventory.directory, we want to reference the value of the Global Variable oracle.base
`oui.inventory.directory = ${var.oracle.base}/oraInventory`

To reference a value of a property we need to specify 
${property path}

var.
rxr.infra Compute Group, WebTier and LoadBalancer
rxr.wls.Fmw-1 - Middleware Settings
rxr.wls. WebLogic Domain
rxr.def  Products, Keystore

### Locating a property within another property of type 'object'
<object-property-key>.<property-key>

Locating a property within another property of type 'map'
<map-property-key>[<mystId>]
Example - param[sys-password]

See Name Value Parameters with RCU

Locating a property within another property of type 'list'
<list-property-key>[<mystId>].<property-key>

### Global Variables
MyST supports the notion of global variables, these are referenced in a similiar way to properties. But need to be preceded with the prefix `var`. 

For example, to reference the value of `install.directory` we would specify `${var.install.directory}`
