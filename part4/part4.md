#Part 4: Platform Configuration

* Pacthing
* Adjust Server Startup Arguments


## Patching
Oracle often provides patches for their products. These patches can be applied through a utility provided by Oracle known as OPatch. MyST Studio has full support for applying these Oracle patches. This can be done by defining patches directly in the Platform Blueprint.

In 11g, Oracle patches are applied on a per-product basis. This means that in the MyST Studio blueprint editor, you would define the patches under a specific product. In 12c, Oracle patches are applied globally for all of Fusion Middleware rather than on a per product basis. For that reason, in 12c, it is recommend to define patches under Oracle WebLogic as a convention.

> Note: Prior to 12c, WebLogic patches were not applied by OPatch and were instead done through a tool called BSU. MyST Studio has support for both OPatch and BSU allowing patching for any of the products in the 11g and 12c product familities.

Before MyST Studio can apply patches, they need to be first downloaded from My Oracle Support. Once downloaded, patches should be made available for consumption by MyST Studio at provision-time. One common approach for doing this, is to place the patches on a software share that is made available to all target hosts. This is the approach that we will take.




### Add the Oracle Patch in MyST Studio

### Configure Server Startup Arguments
Server Startup Arguments are used for providing arguments to the Java Virtual Machine for specific WebLogic Server instances. Server Startup Arguments are commonly used for defining memory settings. In MyST Studio, Server Startup Arguments can be tuned on a per-product basis under the Global Variables

> Note: In 11g, Coherence cluster arguments were required to be defined under the server start arguments. As this is a complex and error-prone process, MyST Studio will automatically generate this for you when you have products in your Blueprint that use Coherence out of the box, such as SOA Suite. You don't have to worry about missing this step or making a mistake.

Global Variables are used in MyST for defining common properties that are referenced by other configuration items in a Platform Blueprint or Model. For Server Startup Arguments, there is a property under Global Variables for each product in the convention <product-id>.args. When the WebLogic server instances are computed, this property is automatically referenced. This makes is easy to define a common property once to be used across a number of WebLogic Server instances in a cluster rather than managing each Server's properties separately like you would have to do when using the WebLogic Administration Console to do manual configuration.

> Note: Server Startup Arguments defined with the convention <product-id>.args are applied during start up by the WebLogic Node Manager. This is different to those defined with the convention <server-id>.userMemArgs which are instead applied by manipulating the start up scripts directly. Because the Admin Server arguments are unable to be managed by the Node Manager due to an Oracle product constraint, Admin Server start up arguments should be defined using the property admin.server.userMemArgs. MyST automatically does this for you by default.


### Startup and Shutdown Classes
WebLogic allows us to configure startup and shutdown classes in order to perform tasks when we start up or gracefully shut down the server. 

Start

A startup class is a Java program that is automatically loaded and executed when a WebLogic Server is started or restarted. For information about when WebLogic Server loads and executes startup classes, see "Ordering Startup Class Execution and Deployment."

A shutdown class is a Java program that is automatically loaded and executed when the WebLogic Server is shut down either from the Administration Console or the weblogic.admin shutdown command. For more information about when a server invokes startup and shutdown classes, refer to "Server Lifecycle."
To use startup or shutdown classes, you must configure and assign them to servers or clusters. 

| Property | Description |
| -------- | ----------- |
| Name | x |
| Target | The cluster to which the class is to be deployed |
| Class Name | Fully qualified name of the Java class |
| Deployment Order | Determines order in which classes are loaded and executed. Items with the lowest Deployment Order value are loaded first. priority is relative to other deployable items of the same type. |
| Arguments | Arguments that the WebLogic server uses to initialize a class. Multiple arguments must be separated with a comma. For example: 
attribute1=value1,attribute2=value2 |
| Load Before App Deplyments | x |
| Load Before App Activation | x |


#### Ordering Startup Class Execution and Deployment
By default WebLogic Server startup classes are run after the server initializes JMS and JDBC services, and after applications and standalone modules have been deployed.

If you want to perform startup tasks after JMS and JDBC services are available, but before applications and modules have been activated, you can select the Run Before Application Deployments option

LoadBeforeAppDeployments attribute to "true

LoadBeforeAppActivation attribute to "true"

> Note: The startup or shutdown class must be on the classpath of each server to which it is assigned. See [Configure Server Startup Arguments](tbc) for further details.

## Resources

JDBC Data Sources

Java Message Service (JMS)
- Include SAF

JCA Adapters

LDAP Setup for WebLogic

Mail Sessions

Custom Identity and Trust Store

JTA Timeout