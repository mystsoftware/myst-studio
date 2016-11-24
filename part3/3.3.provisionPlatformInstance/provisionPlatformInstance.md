## Provision and Manage Platform Instance

### Provision Platform Instance

We are now ready to provision our 12c SIT environment. From the side menu navigate to`Modeling` &gt; `Platform Model`, this will display a list of existing Platform Models. 

From the side menu navigate to`Provisioning` > `Platform Instances`, this will display a list of existing Platform Models. For each Platform Model, MyuST will indicate if there is currently a provisioned platform instance for that mdoel, and if there is, will indicate the current version and revision of the Platform Blueprint and Platform Model (outlinned in red below).

![]()

To provision a Platform Instance, select the corresponding Platform Model, MyST will display summary information about the state of the Platform Model and Instance as shown below.

![]()

Click on the `Actions` menu and select `Provision`, MyST will open a dialogue allowing you to enter any notes and requesting confirmation of the action, Click `Finish`.MyST will start the process of provisioning the Oracle Middleware, this will take approx 40 minutes to complete.

![]()


### Verify Platform Instance
Once our Platform Instance has been successfully provisioned, click on the `Actions` menu and select `View`.

![]()

This will open the Platform Viewer, where we can view all details about the configuration of the Platform Instance. In addition, MyST provides the URL's for the relevant administration consoles (outlined in red).

![](/content/images/2016/10/VerifyPlatformInstance2.PNG)

If we click on the link for the `Admin Console`, this will take us to the login page for the WebLogic Admin Console. Login and got the `Servers` summary page. Here we can see the list of our newly migrated 12c SOA and OSB Servers.


