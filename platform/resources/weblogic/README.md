# {{ page.title }}

MyST's approach of using Platform Blueprints / Models to define the target state of our Oracle Middleware infrastructure allows us to automate not just the initial provisioning of the Oracle Middleware platform instance, but also its configuration.

This configuration can be applied, either as part of the initial provisioning of the platform instance or later by modifying Platform Blueprints / Model and performing an update action against the Platform Instances.

This section details how to define some of the more common Oracle Middleware configurations, such as:
* **WebLogic Server Configurations** - For example, JTA Timeout, Server Startup Arguments and Classes.
* **Patches**
* **JDBC Data Sources** - With examples for Oracle RAC, Microsoft SQL Server and IBM DB2
* **JMS & SAF Configuration** - Configuration of Persistent Stores, JMS Modules, Java Messaging Service (JMS) and Store and Forward (SAF) services
* **JCA Adapters** - Configuration of JCA Adapters and JCA Adapter instances
* **Work Managers** -  Configuration of work managers, including constraints and request classes

<!-- TO DO
* **Authentication Providers** - Such as configuring LDAP setup for WebLogic
* **Mail Sessions**
* **Enabling SSL Listen Port Globally**
* **Custom Identity and Trust Store**
-->


This section only covers a subset of the configurations that can be performed by MyST. If the configuration you need to apply is not documented here, please raise a ticket at [support.rubiconred.com](htttp://support.rubiconred.com) to ask for assistance.

This part contains the following chapters:

* [WebLogic Server Configuration](/platform/resources/weblogic/servers/README.md)

* [Patch Configuration](/platform/resources/weblogic/patches/README.md)

* [Data Sources Configuration](/platform/resources/weblogic/jdbc/README.md)

* [JMS and SAF Configuration](/platform/resources/weblogic/jms/README.md)

    * [Persistent Store Configuration](/platform/resources/weblogic/jms/persistent-stores/README.md)
    * [Java Message Service (JMS) Configuration](/platform/resources/weblogic/jms/modules/README.md)
    * [Store and Forward (SAF) Configuration](/platform/resources/weblogic/jms/store-and-forward/README.md)


* [JCA Adapter Configuration](/platform/resources/weblogic/jca-adapters/README.md)

* [Work Manager Configuration](/platform/resources/weblogic/jms/work-managers/README.md)

<!-- TO DO
* [Chapter 4.7 - Configuring Authentication Providers](4.7.introspectPlatformBlueprint/3.7.0.introspectPlatformBlueprint.md)

* [Chapter 4.8 - Configuring Mail Sessions](4.8.sideBySideUpgrade/4.8.0.sideBySideUpgrade.md)
-->


