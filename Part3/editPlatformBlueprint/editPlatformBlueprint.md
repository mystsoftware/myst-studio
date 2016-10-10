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
The `Property View` displays the properties and values for the selected component. By default, MyST only shows the core properties for a component. To see all properties, select Show `advance properties`.

To s
Many of the properties are auto-computed by MyST Studio, these are highlighted in green. If we make any changes to the value of a property MyST will show that in white.

![](img/PropertyValues.PNG)

To edit either a Platform Blueprint or Platform Model, click `Edit Configuration`. This will put the Platform Blueprint / Model viewer in **Edit** mode. 

Within the TreeView browse to the component where you want to make changes and click `Edit`.
![](../createPlatformBlueprint/img/PropertyReference.PNG)

, make the required updates and click Save. Saving changes at the component level only saves the changes locally. You can make all the changes you need to the blueprint, and apply them at once by clicking Apply Changes to apply all the saved changes, or Discard to discard all the saved changes. Every time you apply changes to a blueprint version, a new revision is created of the blueprint. You can only view the latest revision of the blueprint. However, if the latest revision of the blueprint is not the same as the revision used to provision an instance, you will need to update the instance from the Platform Model or Platform Instances page.

## MyST Properties - Oveview
MyST stores the content of a Platform Blueprint and Platform Model in a hierarchical or tree-like structure, consisting of the following property types:
* `string` - Primitive type consisting of a key value pair used to hold the value of a property.
* `object` - Complex type consisting of a pre-defined collection of property types, which can be a mixture of string, object, list or paramList types.
* `list` - Complex type consisting of a list of zero, one or more objects of the same type.
* `paramList` - List of zero, one or more `string` property types.

### Referencing MyST Property Values
When defining the value of a primitive property, we can reference the value of one or more other primiative types. For example, if we examine the following properties:
* `oracle.base` - Defines the Oracle Home directory for installing the Oracle Middleware Platform. 
* `oui.inventory.directory` - Defines the Oracle Universal Installer (OUI) Inventory Directory

The default location for (OUI) Inventory Directory is to place this in the sub-directory `inventory` under the Oracle Home. MyST enables us to write an expression similar to:   
`oui.inventory.directory = ${oracle.base}\inventory`

Where the syntax `${<property-path>}` is used to reference the value for property uniquely identified by its `<property-path>`.





## Accessing MyST Properties
The following table lists the object property keys for the top level objects in the Platform Blueprint and the Platform Model.

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

In general, a dot notation is used to traverse the property hierarchy. For example, `a.b.c` would mean locate `c` within `b` within `a`.





### Locating a property within a property of type `object`
`<object-property-path>.<property-key>`

### Locating a property within a property of type `list`
A list is a complex property consisting of an array of zero, one or more objects of the same type. For example, within a WebLogic Domain we will have a list of JDBC Data Sources. To locate an `object` within a list we used the following syntax:

`[<listPropertyPath>.<listObjectType>-<objectKey>]`

Where
* `listPropertyPath` - Is the path to the object containing the list
* `listObjectType` - Is the property object type stored in the list
* `objectKey` - Is the key for the object stored in the list.

For example, a Platform Blueprint contains a list of Products (for example Java, SOA, Service Bus, RCU) that will be installed. In this example, if we want to reference the property object for RCU:

* The Platform Blueprint is the object containing the list. Thus the value of `list-property-path` is `rxr.def`.
* `Product` is the object type stored in the list.
* `rcu` is the object-key for the RCU product object in the list 

Thus the object property path would be expressed as `[rxr.def.Product-rcu]`. To reference the RCU product version we would use the expression:   
    `${[rxr.wls.Product-rcu].version}`

For many lists, the `objectKey` defaults to the index no of the object stored in the list. For example, a WebLogic Domain contains a list of WebLogic Clusters. In this example: 
* The WebLogic Domain is the object containing the list. So `list-property-path` is `rxr.wls`
* `Cluster` is the object type stored in the list.
* `1` is the object-key for the first cluster, `2` the object key for the second cluster, and so on.

Thus the object property path to the second cluster in the list would be expressed as `[rxr.wls.Cluster-2]`. To reference the cluster name we would use the expression:  
`${[rxr.wls.Cluster-2].name}`


### Locating a property within a property of type `paramList`
A `paramList` is a list of zero, one or more `string` property types. The list of properties is not fixed.

To locate an `string` property within a `paramList` we used the following syntax:  
`<paramList-property-path>.param[<string-key>]`

Where
* `paramList-property-path` - Is the path to the object containing the `paramList`
* `string-key` - Is the key for the string property stored in the paramList

For example, the Oracle SOA Suite Product object contains a Name-Value Parameter list, that contains a numnber of `string` properties, such as audit-level and base-port. To reference the base-port value we would use the expression:  

`${[rxr.def.Product-soa].param[base-port]}`


### Locating a Global Variables
MyST supports the notion of global variables, these are referenced in a similiar way to properties. But need to be preceded with the prefix `var`. 

For example, to reference the value of `install.directory` we would specify `${var.install.directory}`
