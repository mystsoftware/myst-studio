## {{ page.title }}

Rubicon Red MyST uses a declarative approach to platform provisioning, meaning users simply define the **target state** of the Oracle Middleware infrastructure to be deployed which, at the push of a button, is automatically provisioned by MyST.

Within MyST, the target state is captured in the *“platform definition”*, which is divided into two layers:

* First, the **Platform Blueprint**: this is an environment agnostic specification used to define the platform topology and configuration of your Oracle Middleware. This provides an abstraction layer over the underlying infrastructure allowing you to define a single Blueprint for all environments.

* Second, the **Platform Model**: this overlays the environment specific configurations.

For each platform instance, we create a separate platform model to define all the environment specific configuration information.

Splitting the *“platform definition”* into two layers provides infrastructure independence, enabling you to provision consistent middleware platforms across all environments regardless of infrastructure type, on premise and on cloud.

### Introspect Existing WebLogic Domains

MyST also allows us to introspect an existing WebLogic Domain and use that to generate an equivalent Platform Blueprint and/or Model. 

We can then use MyST to manage on-going configuration changes for the introspected platform as well as provision new environments with the same configuration. For example, you may want to re-provision your Dev and Test environments to ensure that the configuration of these environments is consistent with Production.

### Side-by-Side Automated Upgrade

MyST provides a simple and automated process for side-by-side upgrades. MyST allows you to introspect an existing 11g environment to create a corresponding 11g Platform Blueprint.

Next, just specify the Oracle Middleware 12c version required. MyST will automatically update the blueprint to one that is compliant with the Oracle Enterprise Deployment Guide for SOA 12c, whilst preserving your 11g configurations. This can then be used to provision an equivalent 12c Oracle Middleware platform.

### Built-in Version Control

Platform Blueprints and Platform Models are put under version control, allowing you to easily edit, review, test, promote and deploy configuration changes across all your environments.

This means incremental configuration changes are simple to make and propagate across all environments. Users just update the Platform Blueprint / Model to reflect the required target state; MyST will determine and perform the required steps to apply the necessary changes. 

MyST Release Pipelines allow you to establish a single integrated process for automating the promotion of Oracle Middleware platform configurations through each stage of the software delivery lifecycle.

### Enables Hybrid Cloud

With built-in support for Oracle Cloud and Amazon Web Services, MyST enables you to define a standard process for delivering Oracle Middleware on premise and on cloud.

MyST provides cloud independence, allowing you to move your middleware infrastructure across different cloud providers as well as providing a path for migrating on-premise platforms to the cloud.

Creating a platform blueprint, platform model, and provisioning a new fully operational FMW environment is a simple three step process which can be performed in minutes.

In the *Platform Fundamentals* section we will look at:

* Platform Modeling

 * [Creating Platform Blueprints](/platform/blueprints/README.md)   

 * [Understanding Platform Templates](/platform/templates/README.md)

 * [Creating Platform Models](/platform/models/README.md)

 * [Editing Platform Blueprints and Models](/platform/definitions/README.md)
    * [Version Control](/platform/definitions/version-control/README.md)
    * [Web-based Editor](/platform/definitions/editor/README.md)


* Automated Provisioning

 * [Provisioning Platform Instances](/platform/provisioning/README.md)


* Automated Change Management

 * [Updating Platform Configuration](/platform/update/README.md)

 * [Managing a Platform Instance](/platform/management/README.md)


* Automated Discovery

 * [Introspecting an existing WebLogic Domain](/platform/introspection/README.md)


* Automated Upgrade

 * [Side-by-Side Automated Upgrade](/platform/upgrade/README.md)

