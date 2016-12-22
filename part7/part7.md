During the lifetime of a project, code will be built and promoted to various staging environments such as Development, System Integration and Test (SIT), User Acceptance and Test (UAT), Pre-Prod, and Production.

Introduced in MyST 5.0; MyST **Release Pipelines** allows you to quickly establish a standardized and repeatable process for managing the deployment and promotion of Oracle Middleware applications and platform configurations through each stage of the Software Delivery Pipeline.

The new Release Pipelines enables you to combine multiple applications into a single pipeline, as well as manage a release that spans multiple production WebLogic domains.

The Release Pipeline Dashboard provides a ‘single pane of glass’ to monitor and manage the promotion of application changes and platform configuration changes through staging environments and into Production.

In this blog, we will look at:

* The anatomy of a Release Pipeline
* The role of Pipeline Templates
* Defining a Simple Application Blueprint
* Implementing a Release Pipeline
* Promoting change through a Release Pipeline

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

For each stream we would specify, zero or more Application Blueprints that we want to deploy.

#### Deployment Platforms
For each Stage / Release Stream combination we need to specify the Platform Instances that we want to target the deployment of the corresponding Platform Blueprint and Application Blueprints 

For example, if we have the stages *CI*, *SIT*, *UAT* and *PROD* in our Release Pipeline and a single stream *SOA* to manage the deployment of Oracle SOA artifacts. We would need to specify the following four deployment targets:

* CI SOA Platform
* SIT SOA Platform
* UAT SOA Platform
* PROD SOA Platform 

And for every additional stream we add, then we would need to add an additional four Platform Instances.

#### Pipeline Groups and Stream Types
Pipeline Groups and Stream Types are user defined, these allows us to categorize each Release Pipeline and Stream and are used for reporting purposes. 

### Role of Pipeline Templates
Most organizations will have a *"standard"* software delivery lifecycle (SDLC) that they follow for the implementation of Oracle Middleware projects. These may vary slightly based on the type of release. For example, we may follow one SDLC for *"project releases"*, but have a shorter SDLC for   for *"patch"* releases.

Pipeline Templates allow us to pre-define a set of ordered stages with promotion schemes defined for each stage. The value of Pipeline Templates, is they allow us to define a standard approach for each type of release.

So in the above example, we could define two templates, one for project releases and a second for patch releases.

#### Creating a Pipeline Template
From the side menu navigate to `Release Management` > `Pipeline Template`, this will display a list of existing templates. Click on `Create New` in the top right-hand corner of the screen. This will open the `Pipeline Template` editor.

Click `Add Stage` and enter CI for the Name and select the CI Environment from the drop-down list. Click `Save`. Follow the same steps to add a stage for SIT, PRE and PROD. Our Pipeline Template should look similar to the screenshot below.

![](/content/images/2016/10/PipelineTemplate.PNG)

### Defining a Simple Application Blueprint 
Within MyST, an Application Blueprint is a collection of artifacts, which have been designed and implemented as part of the same logical solution. The Application Blueprint is version controlled; allowing full control of the configuration of an Application release over time, and provides the ability to roll forward / backwards to a different version of the release at any point in time.

From the side menu navigate to `Release Management` > `Application Blueprints`, this will display a list of existing Application Blueprints. Click on `Create New` in the top right-hand corner of the screen. This will open the `Application Blueprint` editor.

Let's call the Application Blueprint `Stock Application` and set the Version to `1.0.0`. Make sure `Managed by Release Pipeline` is selected.

![](/content/images/2016/10/ApplicationBlueprint0.PNG)

Next we need to define the artifacts which make up our Application Blueprint. Click `Add Artifact`, this will open the `Add Artifacts` dialogue, as shown below. For our purposes we will just select a single artifact; select the Oracle Service Bus `StockServices` artifact and click `Add`. 

![](/content/images/2016/10/AddArtifact.png)

MyST will return to the Application Blueprint editor, we can see that the Artifact has been added to our Application Blueprint.

Notice, by default MyST will always use the LATEST build number. If we wanted to lock the artifact down to a specific build revision we can select a specific Build number.

![](/content/images/2016/10/ApplicationBlueprint.PNG)

Click `Save`, we have now defined our Application Blueprint. The next step is to create a Release Pipeline to manage the deployment of it.

### Defining a Release Pipeline
From the side menu navigate to `Release Management` > `Pipelines`, this will display a list of existing Release Pipelines. Click on `Create New` in the top right-hand corner of the screen. This will open the `Release Pipeline` editor.

Let's call the Release Pipeline `ACME Stock Release Pipeline 1.0` and select `ACM Pipeline Template` as the *Pipeline Template* and `Integration` for the *Pipeline Group*. We can see that the stages of the Release Pipeline have been pre-defined based on the template we created earlier.

![](/content/images/2016/10/ReleasePipeline0-1.PNG)

##### Set CI Promotion Scheme to Automatic
When we defined our Pipeline Template we kept the default promotion scheme of `Manual` for each stage. We are going to modify this for the CI stage, click on the edit icon next to the CI stage (outlined above, in red). This will open the `Edit Stage` dialogue.

![](/content/images/2016/10/ModifyStageCI-1.PNG)

Select `Automatic` for the Promotion Scheme (outlined in red above). This indicates that we want to automatically push changes to the CI environment every time our Platform or Application Blueprint changes. Once done click `Modify`.

##### Create SOA Stream
Within a Release Pipeline, a **Stream** is used define the Platform Blueprint and Application Blueprint(s) to be promoted through each stage.

To define a stream for our Release Pipeline, click `Add Stream`. This will open the `Streams` Editor. Here we will enter `SOA Stream` for the Name and select `SOA` for the Stream Type.

Ensure `SOA Platform` is selected for the Platform Blueprint. This will allow platform updates to be performed as part of the deployment process. Select Stock Application from the list of Application Blueprint(s).

![](/content/images/2016/10/AddStream-1.PNG)

Once done, click `Save`, this will return us to the Release Pipeline Editor. This will now show our SOA Stream, plus the Platform Blueprint and Application Blueprint(s) that make up that stream.

###### Specify Target Platforms
The next step is to specify the target platform for the SOA stream for each stage in the Release Pipeline. The target platform is the Platform Instance to which MyST will apply the Platform Configuration changes as defined by the Platform Blueprint as well as deploy and configure the artifacts defined by the Application Blueprints.

For the SOA Stream / CI Stage select the `CI SOA Environment` platform instance from the drop-down list (outlined in red below). If there was more than one SOA platform instance associated with the CI environment type, we would see more than one option in our drop-down list.

![](/content/images/2016/10/ReleasePipeline1-2.PNG)

We will also select a corresponding platform instance for the remaining stages. Once done click `Save`.

### Activate Release Pipeline
Now that we have finished modelling our Release Pipeline, we are ready to activate it. Open our ACME Stock Release Pipeline and click `Activate`. You will now be prompted if you want to proceed. Click `Yes`. 

As soon as we do this, MyST is going to start deploying our application into our CI environment because we set the CI stage to **automatic**.

Upon activation, MyST will take us to the Release Pipeline Dashboard. Click on Refresh. We should now see that the deployment is pending.

![](/content/images/2016/10/ReleasePipeline2a.PNG)

After approx a minute, we can refresh the Dashboard and we can see that deployment was successful and that the current revision of the build for both the Platform Blueprint and Stock Application Blueprint has been promoted into the CI Environment.

![](/content/images/2016/10/ReleasePipeline3.PNG)

We will see that `pr1` (Platform Revision 1) of the `SOA Platform` Blueprint and `ar1` (Application Revision 1) of the `Stock Application` have been deployed into the CI SOA Environment.

In addition, MyST Studio has created Stream Revision 1 (`sr1`) which is a logical bundle of  `pr1` and `ar1`. We can see that this is now `Ready for release` into SIT.

> For more details on versioning in MyST see [MyST Platform Lifecycle and Versioning](http://blog.rubiconred.com/myst-platform-lifecycle)

##### Promote Release into SIT
Click on the cog icon next to the `Ready for release` status and select `Deploy Release`. 

![](/content/images/2016/10/ReleasePipeline4.PNG)

MyST will open a dialogue, asking you to confirm which release is ready for approval. As soon as we do this, MyST will queue the job for deploying the release into the SIT environment. After approx a minute, we can refresh the Dashboard and we can see that deployment was successful and that the current revision of `Build` for both the Platform Blueprint and Stock Application Blueprint has been promoted into the SIT Environment.

### Promoting Change
When we defined the promotion scheme for the CI Stage we set it to `Automatic`. This indicates that we want to automatically push any changes to the CI environment every time our Platform or Application Blueprint changes.

A change can either be a change in an Artifact contained within the Application Blueprint, for example a developers checks in a revision of the source code, resulting in a new build. Or a change in the Application Blueprint, for example we add a new artifact to the Application Blueprint.

> Note: With automatic, MyST checks for change every 15 minutes (though this is configurable), so if multiple changes have occurred in that time, they will be pushed through as a single change. We can also force MyST to check for and promote any changes immediately by clicking `Run Now`.

##### Adding an Artifact
For the purpose of this blog, we are going to add a second artifact to our Application Blueprint. From the side menu navigate to `Release Management` > `Application Blueprints`, this will display a list of existing Application Blueprints. 

Open the `Stock Application` blueprint and click `Add Artifact`, this will open the `Add Artifacts` dialogue, as shown below. Select the `StockTraderOrder` SCA artifact and click `Add`. 

![](/content/images/2016/10/AddArtifact.png)

MyST will return to the Application Blueprint editor, we can see that the Artifact has been added to our Application Blueprint. Click `Save`.

##### Automatic Promotion of Updated Application Blueprint
As soon as we do this, MyST is going to queue our updated Application Blueprint for deployment into our CI environment (as we set the CI stage to automatic).

Return to the Release Pipeline Dashboard. We should see that the deployment is pending.

![](/content/images/2016/10/ReleasePipeline5.PNG)

After approx a minute, we can refresh the Dashboard and we can see that deployment was successful and that the current revision of the build for both the Platform Blueprint and Stock Application Blueprint has been promoted into the CI Environment.

![](/content/images/2016/10/ReleasePipeline6.PNG)

We can also see that the Stream Revision has been incremented to `SR2` for the CI environment and that it is ready for release into SIT.

### Summary
In this short blog, we have provided a brief overview of how MyST enables us to quickly model a Release Pipeline, allowing us to establish a standardized process for automating the deployment of Oracle Middleware applications through each stage of the software delivery lifecycle.

The Release Pipeline Dashboard provides a ‘single pane of glass’ to monitor and manage the promotion of application changes and platform configuration changes through each staging environment and into Production.