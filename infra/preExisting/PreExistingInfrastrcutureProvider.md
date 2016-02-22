# Configure Pre-Existing Infrastructure in MyST
Once our target hosts are ready, the next step is to define them in MyST and 

We 

need to be put in place prior to installing Oracle Fusion Middleware. You should consult the corresponding Oracle Fusion Middleware system requirements documentation to ensure that your environment meets. 


A pre-existing infrastructure provider is one where the target hosts onto which the Oracle Middleware will be provisioned has been set-up and configured externally to MyST.


1. On Infrastructure Providers page, click **Create New** and select **Pre Existing** to create a new infrastructure provider.
2. Enter a name and description for the provider.
3. Add the following details to your Infrastructure Provider. These details are referenced in your platform model when you select this infrastructure provider, and applied at the time of provisioning.

    * **Key Pairs**  
      Key pairs contains all the key pairs that you can use in the OS agent credentials for the hosts that are part of your Infrastructure Provider.  

      To add a key pair, click **Add Key Pair**, enter a name, add the private key content, and click **Save**. Ensure that the key value format must be PEM and the key must not have a pass phrase.

  * **OS agent credentials**  
    The OS agent credentials is the set of credentials that you can use to run MyST agent on the host. These user credentials are mandatory. If your MyST Studio host definition does not already have OS agent credentials configured, provide a user name and password or key pair in this section, and then add details of the OS admin credentials. MyST Studio connects to the host using the OS admin credentials, and creates the OS agent credentials with the user name and password you provide here. Only the OS agent credentials will be used to run any actions from MyST Studio.

    To add an OS agent credentials, click **Add OS agent credentials**, enter a name, the SSH user name for the OS agent credentials, and either enter a password or select a key pair from the available key pairs in the infrastructure provider definition.

  * **OS admin credentials**  
    An OS admin credentials is a set of credentials which have the ability to create OS agent credentials to run MyST Studio on the target host. When you are defining a host, if you do not already have an OS agent credentials set, select the OS agent credentials that you want to create, and the OS admin credentials that can create it on the host. MyST Studio connects to the host using the OS admin credentials and creates an OS agent credentials based on the details you have selected on the host.

    To create an OS admin credentials, click **Add OS admin credentials**, enter a name, the SSH user name for the OS admin credentials, and either enter a password or select a key pair for the user name. If you want the OS admin credentials to run as a different user on the host, select **Yes** under **Run as different user** and enter the user name. You can add the password for the different user if it is required.

  * **Hosts**  
    List of physical hosts that are available as part of the infrastructure provider. Each host you select must be associated with a compute logical definition. This ensures that when you select the infrastructure provider in your platform model, only the hosts that map to the compute logical definition associated with the compute groups in the model can be selected.

    To add a host, click **Add Host**. Enter a name for the host entry, the Host name or IP address for the host, and the SSH Port. Select a compute logical definition for the host, and select which environments the host can be assigned to. Select the OS agent credentials to connect to the host. If the OS agent credentials you have select is not yet created, and you need MyST Studio to create the OS agent credentials, select **Yes** under **Configure OS agent credentials** and select the OS admin credentials. Click **Add** to add the host.

4. Click **Save** to save your infrastructure provider.