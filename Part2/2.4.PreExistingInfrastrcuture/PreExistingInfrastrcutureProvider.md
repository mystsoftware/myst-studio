# Configure Pre-Existing Infrastructure Provider in MyST
Within MyST, a Pre-Existing Infrastructure Provider is used to capture the list of virtual or physical hosts that are available to provision our Oracle Middleware environment to. 

During the Provisioning process, MyST connects to each of the target hosts via SSH to perform some of the initial install and configuration tasks. 

1. MyST connects to host where the WebLogic Admin Server will be installed and downloads the MyST Agent.
2. The MyST agent will perform the initial install and configuration tasks. These tasks are performed locally by the MyST agent on the Admin Host.
3. The MyST Agent on the Admin Server will connect remotely via SSH to the other target host in the WebLogic Domain and perform install and configuration tasks  remotely.

The credentials that MyST uses to connect to and execute jobs on each of the hosts via SSH are known in MyST as the **OS Agent Credentials**. These credentials consist of a username and password or username and key pair. 

>> Tip: When creating these credentials in MyST, the username should be the `oracle` user we configured in Target Host Configuration.

MyST Studio has support for creating the **OS Agent Credential** if it does not exist on the target hosts. In order to do this, you need to provide a privileged user account known as an **OS Admin Credential**. 

If your MyST Studio host definition does not already have OS agent credentials configured, provide a user name and password or key pair in this section, and then add details of the OS admin credentials. 

MyST Studio connects to the host using the **OS Admin Credentials**, and creates the **OS Agent Credentials** with the user name and password you provide here. Only the OS Agent Credentials will be used to run any actions from MyST Studio.

## List Infrastructure Providers
To see details of the defined Infrastructure Providers, click  `Infrastructure` > `Infrastructure Providers`. By default, this will display details of **All** Infrastructure Providers. We can filter this by selecting `Pre-Existing` in the `Filter by` drop down as shown below.

![](img/PreExistingInfraList.PNG)

## Create Pre-Existing Infrastructure
Click `+ Create New` and select `Pre Existing` from the options provided. This will open the **Create New Pre Existing** dialogue. Specify the following values:

* **Name** - Short hand name for the Pre-Existing Infrastructure Provider
* **Description** - A longer description of the Pre-Existing Infrastructure Provider

![](img/PreExistingInfraAdd.PNG)

For each infrastructure provider, we can add one or more:

* **Key Pairs:** Used to define all the required key pairs used to connect to the hosts within the Infrastructure Providers. Each MyST Key Pair contains the private key for key pairs that we can use in credentials for the hosts that are part of our Infrastructure Provider.  

  Once we have defined a key pair, we can use it in one or more OS Agent Credentials and OS Admin Credentials.

* **OS Agent credentials:**  The OS agent credentials is the set of credentials that MyST uses to connect to and execute jobs on the target hosts. Each Credential consists of a username and credential, which can be either a Key Pair or Password.

    Once we have defined an OS Agent Credential, we can use it in one or more Hosts.

* **OS Admin Credentials:** Reserved for future functionality.

* **Hosts:** List of physical hosts that are available as part of the infrastructure provider. 


Click **Save** to save your infrastructure provider.

## Key Pairs

### Add Key Pair
To add a key pair, click `Add Key Pair`, enter a name, add the private key content, and click **Save**. Ensure that the key value format must be PEM and the key must not have a pass phrase.

### Edit Key Pair
To edit  a key pair; click on the name of the key pair within the Infrastructure Provider, this will open the **Edit Key Pair** dialogue.

Here you can modify the content of the Private Key; to do this click `Change Content` and you will be prompted to enter the Private Key content. Once done, click `Save` to confirm your changes.

![](img/KeyPairEdit.PNG)

### Delete Key Pair
To delete a key pair, open the Edit Key Pair dialogue and click `Delete`.

**Note:** You can only delete Key Pairs that are not assigned to any Credentials.

##OS Agent Credentials

### Add OS Agent Credential
To add a OS Agent Credential, click `Add Agent Credential`, Specify the following values:

* **Name** - Short hand name for the OS Agent Credential
* **SSH User Name** - The SSH User Name that will be used to connect to the host
* **Connect Using** - Specifies the type of credentials used to authenticate the SSH user, can be  either `Key Pair` or `Password`
* **Key Pair** - If `Key Pair` is specified, then select the Key Pair to use from the Drop Down.
* **Password** - If `Password` is specified, then enter the password to be used to authenticate the user.

Click `Save` to save the new OS Agent Credential.


enter a name, add the private key content, and click **Save**. 

    To add an OS agent credentials, click **Add OS agent credentials**, enter a name, the SSH user name for the OS agent credentials, and either enter a password or select a key pair from the available key pairs in the infrastructure provider definition.

### Add OS Admin Credential

### Add Hosts
To add a host, click **Add Host**. Enter a name for the host entry, the Host name or IP address for the host, and the SSH Port. Select a compute logical definition for the host, and select which environments the host can be assigned to. Select the OS agent credentials to connect to the host. If the OS agent credentials you have select is not yet created, and you need MyST Studio to create the OS agent credentials, select **Yes** under **Configure OS agent credentials** and select the OS admin credentials. Click **Add** to add the host.

For each host we need to capture basic details:
* **Name**: Name with MyST used to refer to the host
* **Host Name**: Network address of the host, can also be the IP Address
* **Compute Definition**: Used to specify the Operating System of the target host.
* **SSH Port**: The SSH Port of the target host, defaults to 22.
* **Environment(s)**: Hosts must be tagged to one or more Environments. When we create a platform model, only the hosts tagged to the same  Environment Type as the platform model can be selected within the model.
* **OS agent credentials**  
    The OS agent credentials is the set of credentials that you can use to run MyST agent on the host. These user credentials are mandatory. If your MyST Studio host definition does not already have OS agent credentials configured, provide a user name and password or key pair in this section, and then add details of the OS admin credentials. MyST Studio connects to the host using the OS admin credentials, and creates the OS agent credentials with the user name and password you provide here. Only the OS agent credentials will be used to run any actions from MyST Studio.

    To add an OS agent credentials, click **Add OS agent credentials**, enter a name, the SSH user name for the OS agent credentials, and either enter a password or select a key pair from the available key pairs in the infrastructure provider definition.


such as the hostname and connection details.

, in which we define the list of hosts available.


List of physical hosts that are available as part of the infrastructure provider. Each host you select must be associated with a compute logical definition. This ensures that when you select the infrastructure provider in your platform model, only the hosts that map to the compute logical definition associated with the compute groups in the model can be selected.


For each host we need to specify:

* Hostname
* SSH 
* Compute Definition


Within MYST any resource that is environment specific, such as a Platform Model, Platform Instance or Application Model is tagged to an Environment Type, this in conjunction with Role Based Access Control (RBAC) allows us to control who can perform which actions in which environment.

In addition target hosts (see Pre-Existing Infrastructure Providers) can be tagged to one or more Environment Types. When we create a platform model, only the hosts tagged to the same  Environment Type as the platform model can be selected within the model.


Once our target hosts are ready, the next step is to define them in MyST and 

We 

need to be put in place prior to installing Oracle Fusion Middleware. You should consult the corresponding Oracle Fusion Middleware system requirements documentation to ensure that your environment meets. 


A pre-existing infrastructure provider is one where the target hosts onto which the Oracle Middleware will be provisioned has been set-up and configured externally to MyST.


1. On Infrastructure Providers page, click **Create New** and select **Pre Existing** to create a new infrastructure provider.
2. Enter a name and description for the provider.
3. Add the following details to your Infrastructure Provider. These details are referenced in your platform model when you select this infrastructure provider, and applied at the time of provisioning.




[^1]This is 