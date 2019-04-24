## {{ page.title }}

An On-Demand (AWS) infrastructure provider is one where hosts onto which the Oracle Middleware will be installed are created on-demand as part of the process of provisioning the Oracle Middleware platform. This approach relies upon an Amazon Machine Image (AMI), which is a Virtual Machine template, for creation of target hosts that underpin the Oracle Middleware platforms.

For EC2 instances, you are not _required _ to pre-register hosts in the Infrastructure Providers since these are delivered through Infrastructure-as-a-Service. 
However, if you _want_ to pre-register the hosts, say if different teams are responsible for provisioning the target VM and for provisioning the Middleware, then you can easily do so with the Pre-Existing Infrastructure feature.

### Create Pre-Existing Infrastructure
Click `Create New` and select `On Demand(AWS)` from the options provided. This will open the **Create New On Demand** dialog. Here we need to specify the following values:

* **Name** - Shorthand name for the On Demand Infrastructure Provider.
* **Description** - A longer description of the On Demand Infrastructure Provider.
* **Region** - Select your AWS Region.
* **Authentication Mechanism** - Select Access Keys / Secret Keys Authentication Mechanism and provide valid Access Key and Secret Key.

![](img/OnDemandInfraAdd.png).

Click on create.





