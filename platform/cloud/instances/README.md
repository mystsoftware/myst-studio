# {{ page.title }}

In addition to the rich support for [introspecting](/platform/introspection/README.md) existing WebLogic-based Platform Instances. MyST supports the direct registration of given Oracle Platform-as-a-Service instances. These instances do not need to have been previously provisioned via MyST.

To register a **Process Cloud Service** platform instance.

1. Navigate to **Provision** > **Platform Instances**
2. Click **Create New**
3. Enter the following **Process Cloud Service** connection details
  - Service Name
  - Service URL
  - Username
  - Password
4. Create a new **Infrastructure Provider** or choose an existing one.
5. Create a new **Platform Blueprint** or choose an existing one. 
6. Click **Create**

After the instance is created, the Platform Instance will be available for use within a [MyST Release Pipeline](/release/pipeline/README.md)
  
{% hint style='info' %}
Any existing Oracle PAAS-flavoured Infrastructure Providers and Blueprints will be available from the dropdown when registering Cloud Instances and Non-Oracle PAAS-flavoured components will be excluded from the list.
{% endhint %}

