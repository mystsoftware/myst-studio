# Release Pipelines
During the lifetime of a project, code will be built and promoted to various staging environments such as Development, System Integration and Test (SIT), User Acceptance and Test (UAT), Pre-Prod, and Production.

MyST **Release Pipelines** allows you to quickly establish a standardized and repeatable process for managing the deployment and promotion of Oracle Middleware applications and platform configurations through each stage of the Software Delivery Pipeline.

Release Pipelines enable us to combine multiple applications into a single pipeline, as well as manage a release that spans multiple production WebLogic domains.

The Release Pipeline Dashboard provides a ‘single pane of glass’ to monitor and manage the promotion of application changes and platform configuration changes through staging environments and into Production.

### Anatomy of a Release Pipeline
A Release Pipeline is used to promote both Platform Blueprints and / or Application Blueprints through multiple staging environments to a particular environment, typically production.

> Note; within MyST, Application Blueprints are used to define the artifacts which make up an application, whilst Platform Blueprints are used to define the topology and configuration of our Oracle Middleware platform.

#### Stages
A Release Pipeline is broken into Stages, these stages will typically be aligned with each of the staging environments in our Software Delivery Life-cycle, for example CI, SIT, UAT and PROD.

Each stage has a promotion scheme, which can be automatic or manual. Automatic is useful for Continuous Integration, where as manual is useful when you want to control **when** the deployment is triggered. 

For manual deployments, we also have the option of specifying whether it requires approval prior to deployment.

#### Release Streams
A Release Pipeline can consist of one or more Release Streams. A Release Stream is targeted to an Oracle Middleware platform as defined by its Platform Blueprint and can contain zero or more Application Blueprints. 

A common use case for multiple Release Streams would be if you wanted to perform a release across multiple WebLogic domains such as a release to an ADF and SOA WebLogic Domain.

For each stream we would specify, zero, one, or more Application Blueprints that we want to deploy.

#### Deployment Platforms
For each Stage / Release Stream combination we need to specify the Platform Instances that we want to target the deployment of the corresponding Platform Blueprint and Application Blueprints 

For example, if we have the stages *CI*, *SIT*, *UAT* and *PROD* in our Release Pipeline and a single stream *SOA* to manage the deployment of Oracle SOA artifacts. We would need to specify the following four deployment targets:

* CI SOA Platform
* SIT SOA Platform
* UAT SOA Platform
* PROD SOA Platform 

And for every additional stream, we would need to add an additional four Platform Instances.

#### Pipeline Groups and Stream Types
Pipeline Groups and Stream Types are user defined, these allows us to categorize each Release Pipeline and Stream and are used for reporting purposes. 

### Role of Pipeline Templates
Most organizations will have a *"standard"* software delivery lifecycle (SDLC) that they follow for the implementation of Oracle Middleware projects. These may vary slightly based on the type of release. For example, we may follow one SDLC for *"project releases"*, but have a shorter SDLC for   for *"patch"* releases.

Pipeline Templates allow us to pre-define a set of ordered stages with promotion schemes defined for each stage. The value of Pipeline Templates, is they allow us to define a standard approach for each type of release.

For example, in the above scenario, we could define two templates, one for project releases and a second for patch releases.

This part contains the following chapters:

* [Chapter 7.1 - Pipeline Organization](/part7/7.1.pipelineOrganization/7.1.0.pipelineOrganization.md)   
    * [Chapter 7.1.1 - Pipeline Groups](/part7/7.1.pipelineOrganization/7.1.1.pipelineGroups.md)   
    * [Chapter 7.1.2 - Stream Types](/part7/7.1.pipelineOrganization/7.1.2.streamTypes.md) 
* [Chapter 7.2 - Pipeline Templates](/part7/7.2.pipelineTemplates/7.2.0.pipelineTemplates.md)
* [Chapter 7.3 - Configuring Release Pipelines](/part7/7.3.pipelines/7.3.0.pipelines.md)
* [Chapter 7.4 - Release Pipeline Dashboards](/part7/7.4.pipelineDashboard/7.4.0.pipelineDashboard.md)
