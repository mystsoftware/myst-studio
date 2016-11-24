## Provision and Manage Platform Instance

### Provision Platform Instance
Once we have created our Platform Model, we are now ready to provision it. 

>> Note: Before we can provision a Platform Instance, their needs to be a committed version of the corresponding Platform Blueprint and Platform Model. See [Platform Blueprint and Model Versioning]() for more details.

From the side menu navigate to`Provisioning` > `Platform Instances`, this will display a list of existing Platform Models. 

For each Platform Model, MyST will indicate if there is currently a provisioned platform instance for that model, and if there is, will indicate the current version and revision of the Platform Blueprint and Platform Model (outlinned in red below).

![]()

To provision a Platform Instance, select the corresponding Platform Model, MyST will display summary information about the state of the Platform Model and Instance as shown below.

![]()

Click on the `Actions` menu and select `Provision`, MyST will open a dialogue allowing you to enter any notes and requesting confirmation of the action, Click `Finish`.MyST will start the process of provisioning the Oracle Middleware, this will take approx 40 minutes to complete.

![]()


### Verify Platform Instance
Once our Platform Instance has been successfully provisioned, click on the `Actions` menu and select `View`.

![]()

This will open the Platform Viewer, where we can view all details about the configuration of the Platform Instance. In addition, MyST provides the URL's for the relevant administration consoles (outlined in red).

![]()

If we click on the link for the `Admin Console`, this will take us to the login page for the WebLogic Admin Console. Login and got the `Servers` summary page. Here we can see the list of our newly migrated 12c SOA and OSB Servers.

### Start, Stop and Restarting Platform Instance
From the MyST Studio console, go to Modeling > Platform Models.


Click on the row for the CI environment, this will bring up more information on the right side of the screen. 

Click on Actions in the top right hand corner and select Control.

Select Restart as the action you want to perform. In a clustered environment, you can choose to restart only specific nodes. As we have only one node we can leave all other defaults.