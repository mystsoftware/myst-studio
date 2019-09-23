# {{ page.title }}

In addition to the rich support for [introspecting](/platform/introspection/README.md) existing WebLogic-based Platform Instances, MyST supports the direct registration of various Oracle Platform-as-a-Service instances. These instances do not need to have been previously provisioned via MyST. Once these instances have been registered they can be used as deployment targets for Application Release Automation.

MyST supports the following Oracle Platform-as-a-Service types:
 - Oracle Integration Cloud
 - Process Cloud Service (Legacy)
 - Integration Cloud Service (Legacy)

To register an Oracle Platform-as-a-Service platform instance:

1. Navigate to **Provision** > **Platform Instances**
2. Click **Register Existing** and the select **OPaaS Instance**
3. You will first be prompted to select a Platform Blueprint and an Environment Type. 
 - In the case of Oracle Platform-as-a-Service Instance, Platform Blueprints are used to group Platform Instances that belong to the same Release Pipeline.
 - If we are registering our first Oracle Platform-as-a-Service Instance, we have the option to **Create New**. Otherwise, we can select an existing Platform Blueprint that was created from a previous Platform Instance registration 
 - The [Environment Type](/infrastructure/environment-types/README.md) is used to categorise the Platform Instance so that it can be easily selected against a given Release Pipeline Stage.
4. Next, we will be presented with the option to create a new Infrastructure Provider or select an existing. Enter the following details
  - **Infrastructure Provider**: This will be the name of both the Infrastructure Provider and the Platform Instance/Model.
  - Service Type: The type of service. Select from one of the following:
    - Oracle Integration Cloud
    - Process Cloud Service (Legacy)
    - Integration Cloud Service (Legacy)
  - **Identity Domain**: This is the name of the identity domain for Oracle Cloud 
  - **Service Name**: This is the name of the OPaaS service
  - **Service URL**: MyST will attempt to auto-generate this from the previously entered Identity Domain and Service Name. However, it can also be overridden in a case the Service URL is different to the one provided by MyST
  - **Username**: This is the username. Typically, an email address.
  - **Password**: This is the password for the OPaaS service for the given username.
5. Finally, we will be presented with a summary. Click **Finish** to complete the registration.

After the instance is created, the Platform Instance will be available for use within a [MyST Release Pipeline](/release/pipeline/README.md). There will also be an Infrastructure Provider, Platform Instance and Platform Blueprint created if you choose to **Create New** during the wizard.
  
{% hint style='info' %}
Any existing Oracle PAAS-flavoured Infrastructure Providers and Blueprints will be available from the dropdown when registering Cloud Instances and Non-Oracle PAAS-flavoured components will be excluded from the list.
{% endhint %}

