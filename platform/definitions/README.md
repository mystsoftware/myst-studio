## {{ page.title }}

Within MyST, the target state of each Platform Instance is captured in the _“platform definition”_, which is divided into two layers: 
* First, the Platform Blueprint defines an environment agnostic specification used to define the platform topology and configuration of your Oracle Middleware. 
* Second, the Platform Model overlays the environment specific configurations. 

This _“platform definition”_ is used to manage the entire platform lifecycle from provisioning the initial platform instance through to managing on-going configuration changes.

This means incremental configuration changes are simple to make and propagate across all environments. Users just update the target state in the Platform Blueprint / Model and then deploy these changes as required against the Platform Instance. MyST will determine and perform the required steps to apply the necessary changes.

This declarative approach to defining target state enables MyST to treat Oracle Middleware infrastructure as code. Platform Blueprints and Models are put under version control, allowing us to easily propose, review, test, promote and deploy configuration changes.

To learn how to create a Platform Blueprints and Models can be Version Controlled it is recommended to follow the guide:

* [Understanding Platform Blueprint and Model Version Control](/platform/definitions/version-control/README.md)

To learn how to edit configuration for Platform Blueprints and Models it is recommended to follow the guide:

* [Editing Platform Blueprints and Models](/platform/definitions/editor/README.md)


