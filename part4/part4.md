# {{ page.title }}

MyST's approach of using Platform Blueprints / Models to define the target state of our Oracle Middleware infrastructure allows us to automate not just the initial provisioning of the Oracle Middleware platform instance, but also its configuration.

This configuration can be applied, either as part of the initial provisioning of the platform instance or later by modifying Platform Blueprints / Model and performing an update action against the Platform Instances.

This section details how to define some of the more common Oracle Middleware configurations, such as:
* **WebLogic Server Configurations** - For example, JTA Timeout, Server Startup Arguments, and Classes.
* **Patches**
* **JDBC Data Sources** - With examples for Oracle RAC, Microsoft SQL Server, and IBM DB2
* **JMS & SAF Configuration** - Configuration of Persistent Stores, JMS Modules, Java Messaging Service (JMS) and Store and Forward (SAF) services
* **JCA Adapters** - Configuration of JCA Adapters and JCA Adapter instances.
* **Work Managers** -  Configuration of work managers, including constraints and request classes.

<!-- TO DO
* **Authentication Providers** - Such as configuring LDAP setup for WebLogic
* **Mail Sessions**
* **Enabling SSL Listen Port Globally**
* **Custom Identity and Trust Store**
-->


This section only covers a subset of the configurations that can be performed by MyST. If the configuration you need to apply is not documented here, please raise a ticket at [support.rubiconred.com](htttp://support.rubiconred.com) to ask for assistance.

This part contains the following chapters:

* [Chapter 4.1 - WebLogic Server Configuration](4.1.weblogicServerConfiguration/4.1.0.weblogicServerConfiguration.md)

* [Chapter 4.2 - Patching](4.2.patching/4.2.0.patching.md)

* [Chapter 4.3 - Configuring JDBC Data Sources](4.3.configureDataSource/4.3.0.configureDataSource.md)


* [Chapter 4.4 - JMS and SAF Configuration](4.4.configureJmsSaf/4.4.0.configureJmsSaf.md)
    * [4.4.1 - Persistent Store Configuration](4.4.configureJmsSaf/4.4.1.configurePersistentStores.md)
    * [4.4.2 - Java Message Service (JMS) Configuration](4.1.configureJmsSaf/4.4.2.configureJms.md)
    * [4.4.3 - Store and Forward (SAF) Configuration](4.1.configureJmsSaf/4.4.3.configureSaf.md)
    

* [Chapter 4.5 - JCA Adapter Configuration](4.5.configureJcaAdapter/4.5.0.configureJcaAdapter.md)

* [Chapter 4.6 - Work Manager Configuration](4.6.workManagers/4.6.0.workManagers.md)

<!-- TO DO
* [Chapter 4.7 - Configuring Authentication Providers](4.7.introspectPlatformBlueprint/3.7.0.introspectPlatformBlueprint.md)

* [Chapter 4.8 - Configuring Mail Sessions](4.8.sideBySideUpgrade/4.8.0.sideBySideUpgrade.md)
-->


