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

Click on create.Once you click on create you can see all the information like VPCs, Subnets, Security Groups, AMIs, Instance Types and AWS Key Pairs present in the region with given Authentication Mechanism.

![](img/OnDemandCreate.png).

* **VPC(Virtual Private Cloud)** - Select the respective VPC where you want to create your Infrastructure.
* **Subnet** - Select the subnet from your VPC where you want to launch your AWS Infrastructure.
* **Security Group** - Select the corresponding security group that's created for the VPC you selected.
* **AMI** - AMI provides the information required to launch an Infrastructure like an operating system, an application server, and applications and permissions that control which AWS accounts can use the AMI to launch instances. Select the AMI based on your requirement.
* **Instance Type** - It specifies the hardware of the host computer used for your instance. Each instance type offers different compute, memory, and storage capabilities. Select the instance type based on your requirement.
* **AWS Key Pairs** - This is the private key content that is accessed securely to access your infrastructure. Select valid AMI and provide the private key content.

* **OS Admin Credentials:** Reserved for future functionality.
* **Agent Key Pairs:** Used to define all the required key pairs used to connect to the hosts within the Infrastructure Providers. Each MyST Key Pair contains the private key for key pairs that we can use in credentials for the hosts that are part of our Infrastructure Provider.  

  Once we have defined a key pair, we can use it in one or more OS Agent Credentials and OS Admin Credentials.

* **OS Agent Credentials:**  The OS agent credentials is the set of credentials that MyST uses to connect to and execute jobs on the target hosts. Each Credential consists of a username and credential, which can be either a Key Pair or Password.

    Once we have defined an OS Agent Credential, we can use it in one or more Infrastructures.
    

* **OS Admin Credentials:** Reserved for future functionality.

Click **Save** to save your infrastructure provider.

* **OS Admin Credentials:** Reserved for future functionality.







