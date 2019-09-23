## {{ page.title }}

Rubicon Red MyST delivers automated platform provisioning and configuration management for Oracle Middleware, on premise and on cloud, enabling users to deliver a consistent and reliable platform in minutes, NOT weeks or months.

Rubicon Red MyST uses a declarative approach to automation, meaning users simply define the **target state** of the Oracle Middleware infrastructure to be deployed which, at the push of a button, is automatically provisioned by MyST.

Within MyST, the target state is captured in the _“platform definition”_, which is divided into two layers:

* First, the **Platform Blueprint**: this is an environment agnostic specification used to define the platform topology and configuration of your Oracle Middleware. This provides an abstraction layer over the underlying infrastructure allowing you to define a single Blueprint for all environments.

* Second, the **Platform Model**: this overlays the environment specific configurations.

For each environment, we create a separate platform model to define all the environment specific configuration information.

Splitting the _“platform definition”_ into two layers provides infrastructure independence, enabling you to provision consistent middleware platforms across all environments regardless of infrastructure type, on premise and on cloud.

Creating a platform blueprint, platform model, and provisioning a new fully operational FMW environment is a simple three step process which can be performed in minutes.

> Most Oracle Middleware products run on Oracle WebLogic Application Server. WebLogic supports the concept of a Domain to group related clusters and servers. Some organisations use separate domains for each business unit or capability, others use it to group computational workload. How it is used is up to the organisation. For Oracle products that run on WebLogic, a *Platform Blueprint represents a logical definition of a WebLogic domain*. For this reason, it is typical for a separate blueprint to be created in MyST Studio for each unique WebLogic domain type in an enterprise (e.g. SOA, ADF)

## Middleware Infrastructure as Code

This declarative approach to defining target state enables MyST to treat Oracle Middleware infrastructure as code. Platform Blueprints and Platform Models are put under version control, allowing you to easily propose, review, test, promote and deploy configuration changes across all your environments.

This means incremental configuration changes are simple to make and propagate across all environments. Users just update the required target state; MyST will determine and perform the required steps to apply the necessary changes. With MyST there is no need to maintain complicated scripts or workflows for each configuration change, thereby eliminating human errors and simplifying on-going maintenance.

This capability, combined with MyST’s comprehensive governance and role based access control, enforces consistent configuration of your Oracle middleware platforms across all environments, on premise and on cloud. As a result, configuration drift, a major cause of unplanned outages, becomes a thing of the past, ensuring that code gets developed and tested in environments closely aligned to Production, for more successful deployments.

### Discover and Manage Existing Environments

MyST allows you to discover and manage existing environments. Simply point MyST at the existing middleware platform; MyST will introspect the platform instance and create a corresponding Platform Blueprint and Model.

You then use MyST to manage on-going configuration changes for the introspected platform and provision new environments with the same configuration. For example, you may want to re-provision your Dev and Test environments to ensure that their configurations are consistent with Production.

### Enables Hybrid Cloud

With built in support for Oracle Cloud and Amazon Web Services, MyST enables you to define a standard process for delivering Oracle Middleware on premise and on cloud.

MyST provides cloud independence, allowing you to move your middleware infrastructure across different cloud providers as well as providing a path for migrating on-premise platforms to the cloud.

### Integrated Process for Managing Configuration Change

MyST Release Pipelines allow you to establish a single integrated process for automating the promotion of Oracle Middleware platform configurations through each stage of the software delivery lifecycle.

The powerful configuration management features in Release Pipelines provide the option to combine platform configuration changes and application deployments into a single release.

The Release Pipeline Dashboard provides a ‘single pane of glass’ to monitor and manage the promotion of platform configuration changes through staging environments into Production.

### Operational Agility
Designed specifically for Oracle Middleware, Rubicon Red MyST enables you to quickly establish a standardized, repeatable and automated process across your organization for provisioning Oracle Middleware infrastructure and managing on-going configuration change. 

MyST provides organizations with the visibility, control and operational agility to consistently and repeatedly deliver Oracle Middleware solutions faster and with less risk

