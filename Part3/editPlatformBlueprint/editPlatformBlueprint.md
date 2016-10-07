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

# MyST Properties
Within MyST, a Platform Blueprint is an environment agnostic specification used to define the platform toplogy and configuration. The content of a Platform Blueprint is held in a hierarchical or tree-like structure, consisting of the following property types:
* `string` - Primitive type consisting of a key value pair used to hold the value of a property.
* `object` - Complex type consisting of a pre-defined collection of property types, which can be a mixture of string, object, list or paramList types.
* `list` - Complex type consisting of a list of zero, one or more objects of the same type.
* `paramList` - List of zero, one or more `string` property types. The list of properties is not fixed.

MyST Property Reference
When defining the value of a primitive property, we can reference the value of one or more other primiative types. For example, if we examine the following properties:
* `oracle.base` - Defines the Oracle Home directory for installing the Oracle Middleware Platform. 
* `oui.inventory.directory` - Defines the Oracle Universal Installer (OUI) Inventory Directory

The default location for (OUI) Inventory Directory is to place this in the sub-directory `inventory' under the Oracle Home. So we can write an expression similiar to this.

`oui.inventory.directory = ${oracle.base}\inventory`

Where the syntax `${<property-path>}` is used to reference the value for property uniquely identifed by its `<property-path>`

### Accessing MyST Properties
In general, a dot notation is used to traverse the property hierarchy. For example, `a.b.c` would mean locate `c` within `b` within `a`.

To 

The following table lists the object property keys for the top level objects in the Platform Blueprint.

| Object | Object Property Key |
| -- | --------- |
| Global Variables | var |
| Middleware Settings | rxr.wls.Fmw-1 |
| Products | rxr.def |
| Compute Groups | rxr.infra |
| Load Balancers | rxr.infra |
| WebTier Configuration | rxr.infra |
| WebLogic Domain | rxr.wls |
| Keystores | rxr.def |


#### Locating a property within a property of type `object`
`<object-property-path>.<property-key>`

#### Locating a property within a property of type `list`
A list is a complex property consisting of an array of zero, one or more objects of the same type. For example, within a WebLogic Domain we will have a list of JDBC Data Sources. To locate an `object` within a list we used the following syntax:

`[<list-property-path>.<listObjectType>-<indexNo>]`

Where
* `list-property-path` - Is the path to the object containing the list
* `listObjectType` - Is the objectType stored in the list
* `indexNo` - Is the position of the object in the list, with the first object being at position 1.

For example, a WebLogic Domain contains a list of WebLogic Clusters. In this example: 
* The WebLogic Domain is the object containing the list. So `list-property-path` is `rxr.wls`
* Cluster is the objectType stored in the list. So `listObjectType` is `Cluster`

So the property path to the second cluster in the list would be expressed as `[rxr.wls.Cluster-2]`. So to reference the cluster name we would use the expression:

`${[rxr.wls.Cluster-2].name}`


#### Locating a property within a property of type `paramList`
A `paramList` is a list of zero, one or more `string` property types. The list of properties is not fixed.
<paramList-property-path>[<mystId>]

Example - param[sys-password]

To locate an `string` property within a list we used the following syntax:
`<object-property-path>.param[<string-name>]`

Where
* `paramList-property-path` - Is the path to the object containing the `paramList`
* `string-key` - Is the key for the string stored in the paramList

<!-- Document for Sushil https://rubiconred.jiveon.com/docs/DOC-2384-->



See Name Value Parameters with RCU


### Global Variables
MyST supports the notion of global variables, these are referenced in a similiar way to properties. But need to be preceded with the prefix `var`. 

For example, to reference the value of `install.directory` we would specify `${var.install.directory}`