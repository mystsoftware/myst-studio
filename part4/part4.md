#Part 4: Platform Configuration


1. Server Configuration
   * JTA Timeout
   * Server Start Up Arguments
   * Server Start up Classes

1. Oracle Patches

1. JDBC Data Sources
   * Oracle Data Source
   * DB2 Data Source

1. JMS & SAF Configuration
   * Java Messaging Server
   * SAF

1. JCA Adapters
   * Database Adapter
     * Oracle DB Adapter Instance
     * DB2 Adapter Instance

1. WorkManager

1. Configuring Authentication Providers
   * LDAP setup for WebLogic

1. Mail Sessions



Enabling SSL Listen Port Globally
Custom Identity and Trust Store

This part contains the following chapters:

* [Chapter 4.1 - Server Configuration](/part4/4.1.weblogicServerConfiguration/4.1.0.weblogicServerConfiguration.md)   

* [Chapter 4.2 - Patching WebLoigc](/part3/3.2.createPlatformModel/3.2.0.createPlatformModel.md)

* [Chapter 4.3 - Configuring JDBC Data Sources](/part3/3.3.provisionPlatformInstance/3.3.0.provisionPlatformInstance.md)

* [Chapter 4.4 - JMS and SAF Configuration](/part3/3.4.editPlatformBlueprint/3.4.0.editPlatformBlueprint.md)

* [Chapter 4.5 - JCA Adapter Configuration](/part3/3.5.updatingPlatformConfiguration/3.5.0.updatingPlatformConfiguration.md)

* [Chapter 4.6 - Work Manager Configuration](/part3/3.6.managingPlatformInstances/3.6.0.managingPlatformInstances.md)

* [Chapter 4.7 - Configuring Authentication Providers](/part3/3.7.introspectPlatformBlueprint/3.7.0.introspectPlatformBlueprint.md)

* [Chapter 4.8 - Configuring Mail Sessions](/part3/3.8.sideBySideUpgrade/3.8.0.sideBySideUpgrade.md)



## Patching
Oracle often provides patches for their products. These patches can be applied through a utility provided by Oracle known as OPatch. MyST Studio has full support for applying these Oracle patches. This can be done by defining patches directly in the Platform Blueprint.

In 11g, Oracle patches are applied on a per-product basis. This means that in the MyST Studio blueprint editor, you would define the patches under a specific product. In 12c, Oracle patches are applied globally for all of Fusion Middleware rather than on a per product basis. For that reason, in 12c, it is recommend to define patches under Oracle WebLogic as a convention.

> Note: Prior to 12c, WebLogic patches were not applied by OPatch and were instead done through a tool called BSU. MyST Studio has support for both OPatch and BSU allowing patching for any of the products in the 11g and 12c product familities.

Before MyST Studio can apply patches, they need to be first downloaded from My Oracle Support. Once downloaded, patches should be made available for consumption by MyST Studio at provision-time. One common approach for doing this, is to place the patches on a software share that is made available to all target hosts. This is the approach that we will take.




### Add the Oracle Patch in MyST Studio





Start



## Resources

JDBC Data Sources

Java Message Service (JMS)
- Include SAF

JCA Adapters

LDAP Setup for WebLogic

Mail Sessions

Custom Identity and Trust Store

JTA Timeout