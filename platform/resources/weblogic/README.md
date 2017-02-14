# {{ page.title }}

MyST's approach of using Platform Blueprints / Models to define the target state of our Oracle Middleware infrastructure allows us to automate not just the initial provisioning of the Oracle Middleware platform instance, but also its configuration.

This configuration can be applied, either as part of the initial provisioning of the platform instance or later by modifying Platform Blueprints / Model and performing an update action against the Platform Instances.

This section details how to define some of the more common Oracle Middleware configurations, such as:
* **[WebLogic Servers](/platform/resources/weblogic/servers/README.md)** - For example, JTA Timeout, Server Startup Arguments and Classes.
* **[Oracle Patches](/platform/resources/weblogic/patches/README.md)** - To guarantee correct patch-levels
* **[JDBC Data Sources](/platform/resources/weblogic/jdbc/README.md)** - With examples for Oracle RAC, Microsoft SQL Server and IBM DB2
* **[Java Messaging Service (JMS)](/platform/resources/weblogic/jms/README.md)**:
  * [Persistent Store Configuration](/platform/resources/weblogic/jms/persistent-stores/README.md)
  * [JMS Modules, Queues and Topics](/platform/resources/weblogic/jms/modules/README.md)
  * [Store and Forward (SAF) Services](/platform/resources/weblogic/jms/store-and-forward/README.md).
* **[JCA Adapters](/platform/resources/weblogic/jca-adapters/README.md)** - Such as DB, JMS and File Adapters
* **[Work Managers](/platform/resources/weblogic/work-managers/README.md)** - Such as constraint and request classes
* **[Load Balancer Frontends](/platform/resources/weblogic/servers/load-balancer-configuration.md)** - To ensure correct rewriting of server URLs
* **[Webtier Routing Rules](/platform/resources/weblogic/servers/web-tier.md)** - To define Oracle HTTP Server routings
* **[Users, Groups, Roles and Policies](/platform/resources/weblogic/servers/configuring-security.md)** - For advanced setting such as Role Conditions and Credential Maps
* **[Keystore Certificates](/platform/resources/weblogic/servers/applying-certificates.md)** - For apply certificates to keystores
* **[Startup and Shutdown Classes](/platform/resources/weblogic/servers/setting-startup-and-shutdown-classes.md)** - To trigger custom startup or shutdown operations
* **[WebLogic Deployment Targeting](/platform/resources/weblogic/servers/weblogic-deployment-targeting.md)** - For targeting of default resources

<!-- TO DO
* **Authentication Providers** - Such as configuring LDAP setup for WebLogic
* **Mail Sessions**
* **Enabling SSL Listen Port Globally**
* **Custom Identity and Trust Store**
-->

This section only covers a subset of the configurations that can be performed by MyST. If the configuration you need to apply is not documented here, please raise a ticket at [support.rubiconred.com](htttp://support.rubiconred.com) to ask for assistance.


