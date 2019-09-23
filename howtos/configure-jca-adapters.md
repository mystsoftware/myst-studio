## {{page.title}}

MyST Studio supports the automation of any JCA adapter type. JCA Adapters themselves are configured through deployment plans. MyST Studio has a mechanism for defining JCA adapter configuration so that it can be used to generate the deployment plan when the platform is automatically provisioned or updated by MyST.

###Prerequisites

Oracle JCA Adapters are designed to use deployment plans. In the Oracle implementation, the deployment plan is not automatically copied to all of the nodes in a cluster.

As such, there are no operating system prerequisites for JCA adapters to work for a single node instance. However, for a clustered instance one of the following must be in place:

* Shared storage between all nodes in a cluster

This is Oracle's recommendation as per the Enterprise Deployment Guide

* File replication between all nodes in a cluster

With this approach a file replication solution such as Gluster can be used to allow the deployment plan to be distributed to all nodes in a cluster as if they were shared files.

#### Defining the shared storage mount in MyST Studio

Once you have setup shared storage on the operation system, you can update your Platform Blueprint to point to the location of the shared storage. It is generally a good idea to keep this location consistent across all environments to keep the setup process simple.

To update the **Share Home**, from the Blueprint Editor select your domain under **WebLogic Domains**. Click "Edit Configuration" and then "Edit"

![](/howtos/img/howto-config-jca-1.edit-domain.png)

If you did not select Database Persistence when you created your Platform Blueprint, your JMS message store and Transaction Logs will also be stored under this Share Home.  
If you wish to change the location of your Share Deployment Plan Home from the default location which is relative to the Share Home, you can click "Show advanced properties" and edit it from there.

![](/howtos/img/howto-config-jca-2.edit-domain-adv.png)

> Note: A JCA adapter instance update will fail to deploy it's deployment plan if you have a cluster setup and are not pointing to shared or replicated file system directory. In this case, it is possible for the operations person to manually copy the file created on the first host to each host and redeploy the JCA adapter, but this is not recommended during to it's manual nature.

### Supported JCA Adapter Types

To support the configuration of a certain JCA Adapter type, simply set the name of the component to match the name of the adapter in the WebLogic console.

![](/howtos/img/howto-config-jca-3.adpt-types.png)

#### Example: Configuring Database Adapter instances in MyST Studio

##### Step 1: Configure the Database Adapter

Navigate to the Platform Blueprint editor.

Select "Edit Configuration" in the top right-hand corner.

Go to the domain under "WebLogic Domains" in the Model tree view.

Under "JCA Adapters" click on "+" icon to Add.

In the component properties view click "Edit" update the Component name to match that of the JCA adapter name in WebLogic - "DbAdapter".

Next, you need to add the adapter instances.

##### Step 2: Configure an Oracle DB Adapter Instance

Click on "Add Item" next to the "Instance List".

Create a logical name for your instance. This is used only for identifying the instance in MyST Studio and is not used for WebLogic.

![](/howtos/img/howto-config-jca-4.edit-instance.png)

Set a JNDI Name and then click on "Add One" next to "Name-Value Parameters" to add a property.

An example of common property set for Oracle XA DB Adapter instances is:

| Property Name | Property Value | 
| ------------- | -------------- |
| xaDataSource	| jdbc/MyApplicationDataSource |

Click "Save"

##### Step 2: Configure a DB2 Adapter Instance

Click on "Add Item" next to the "Instance List".

Create a logical name for your instance. This is used only for identifying the instance in MyST Studio and is not used for WebLogic.

![](/howtos/img/howto-config-jca-5.edit-instance-2.png)

| Property Name | Property Value | 
| ------------- | -------------- |	
| platformClassName | DB2Platform |
| xaDataSource	| jdbc/ExampleDB2Connection |

Click "Save"

Remember to "Apply Changes".