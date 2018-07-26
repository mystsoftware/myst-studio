# Summary

* [Title and Copyright Information](README.md)

## User Guide

* [Rubicon Red MyST](introduction/README.md)
  * [Platform Provisioning and Configuration](introduction/platform-provisioning/README.md)
  * [Application Release Automation](introduction/application-release-automation/README.md)

---

* [Infrastructure Management](infrastructure/README.md)
  * [Environment Types](infrastructure/environment-types/README.md)
  * [Compute Definitions](infrastructure/compute-definitions/README.md)
  * [Pre-Existing Infrastructure](infrastructure/providers/pre-existing/README.md)
  * [On-Demand Infrastructure](infrastructure/providers/on-demand/aws/README.md)
  * [Host Prerequisites](infrastructure/providers/hosts/README.md)

---

* [Platform Fundamentals](platform/README.md)
  * [Platform Blueprints](platform/blueprints/README.md)
  * [Platform Templates](platform/templates/README.md)
  * [Platform Models](platform/models/README.md)
    * [Pre-Existing Infrastructure](platform/models/pre-existing/README.md)
    * [On Demand \(AWS\)](platform/models/on-demand-aws/README.md)
  * [Registering Cloud Instances](platform/cloud/instances/README.md)
  * [Provisioning Platform Instances](platform/provisioning/README.md)
  * [Updating Platform Instances](platform/update/README.md)
  * [Maintaining Platform Definitions](platform/definitions/README.md)
    * [Platform Version Control](platform/definitions/version-control/README.md)
    * [Platform Editor](platform/definitions/editor/README.md)
      * [Control Bar](platform/definitions/editor/control-bar/README.md)
      * [Tree View](platform/definitions/editor/tree-view/README.md)
      * [Properties View](platform/definitions/editor/properties-view/README.md)
      * [Topology View](platform/definitions/editor/topology-view/README.md)
      * [Source View](platform/definitions/editor/source-view/README.md)
      * [Using Property References](platform/definitions/editor/property-references/README.md)
  * [Managing Platform Instances](platform/management/README.md)
  * [Introspecting Existing Platform Instances](platform/introspection/README.md)
  * [Upgrading Platform Instances](platform/upgrade/README.md)

---

* [Platform Configuration](platform/resources/weblogic/README.md)
  * [WebLogic Servers](platform/resources/weblogic/servers/README.md)
  * [Oracle Patches](platform/resources/weblogic/patches/README.md)
  * [Data Sources \(JDBC\)](platform/resources/weblogic/jdbc/README.md)
  * [Java Messaging Service \(JMS\)](platform/resources/weblogic/jms/README.md)
    * [Persistent Stores](platform/resources/weblogic/jms/persistent-stores/README.md)
    * [JMS Modules and Components](platform/resources/weblogic/jms/modules/README.md)
    * [Store and Forward \(SAF\) Configuration](platform/resources/weblogic/jms/store-and-forward/README.md)
  * [JCA Adapters](platform/resources/weblogic/jca-adapters/README.md)
  * [Work Managers](platform/resources/weblogic/work-managers/README.md)
  * [Load Balancer](platform/resources/weblogic/servers/load-balancer-configuration.md)
  * [Webtier Routing Rules](platform/resources/weblogic/servers/web-tier.md)
  * [Users, Groups, Roles and Policies](platform/resources/weblogic/servers/configuring-security.md)
  * [Keystore Certificates](platform/resources/weblogic/servers/applying-certificates.md)
  * [Startup and Shutdown Classes](platform/resources/weblogic/servers/setting-startup-and-shutdown-classes.md)
  * [Weblogic Deployment Targeting](platform/resources/weblogic/servers/weblogic-deployment-targeting.md)

---

* [Build Automation](build/README.md)
  * [Build Server Configuration](build/server/configuration/README.md)
    * [Continuous Delivery Profile](infrastructure/continuous-delivery-profile/README.md)
    * [MyST Studio Plugin for Jenkins](build/server/configuration/jenkins/README.md)
  * [Configuring Maven Builds](build/maven/README.md)
  * [Configuring Automated Builds ](build/ci/README.md)
    * [Configuring Jenkins Build Jobs](build/ci/jenkins/README.md)
  * [Artifact Management](build/artifacts/README.md)
  * [Deploy Time Customizations](build/deploy-config/README.md)
    * [MyST Configuration Plans](howtos/use-myst-generic-configuration-plans.md)

---

* [Application Deployment](deploy/application/README.md)
  * [Configuring Application Blueprints](deploy/application/blueprints/README.md)

---

* [Release Pipelines](release/README.md)
  * [Pipeline Organization](release/pipeline/organization/README.md)
    * [Pipeline Groups](release/pipeline/organization/groups/README.md)
    * [Stream Types](release/pipeline/organization/stream-types/README.md)
  * [Pipeline Templates](release/pipeline/templates/README.md)
  * [Configuring Release Pipelines](release/pipeline/README.md)
  * [Release Pipeline Dashboards](release/pipeline/dashboard/README.md)

---

* [Role-Based Access Control](administration/README.md)
  * [User Management](administration/users/README.md)
  * [Role Management](administration/roles/README.md)
  * [Workspace Management](administration/workspaces/README.md)

## Administration Guides

* [MyST Installation Guide](installation/myst-studio/README.md)
  * [System Requirements](installation/myst-studio/requirements/README.md)
  * [Docker-based Installation](installation/myst-studio/docker/README.md)
  * [Alternative Installations](installation/myst-studio/alternatives/README.md)
* [MyST Management Scripts](administration/management/README.md)
* [MyST Upgrade Guide](administration/upgrade/README.md)

## Appendix

* [Supported Artifacts](appendix/artifact/README.md)
* [Supported Configuration](appendix/configuration/README.md)
* [Error Codes](appendix/errors/README.md)
