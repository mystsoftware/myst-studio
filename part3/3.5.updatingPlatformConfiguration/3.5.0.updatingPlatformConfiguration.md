## {{ page.title }}

To make configuration changes to a Platform Instance, we need to first update it's *platform definition* as specified by its Platform Blueprint and Platform Model. Once we're happy with our revised *platform definition* we can run a platform update. MyST will automatically determine and perform the required steps to apply the necessary changes.

For the purpose of this section, we are going to walk through the process of adding a new Data Source to our Platform Instance. This involves the following steps:

1. Adding a Data Source to our Platform Blueprint  
2. Adding environment specific details to our Platform Model  
3. Performing an optional dry run to verify our changes  
4. Performing an update against the Platform Instance to apply our changes


### Update Platform Blueprint
When we update a Platform Blueprint we can either do this as a revision to the current blueprint, assuming its state is not FINAL, or create a new version of the Platform Blueprint. For our example, we are going to create a new version.

#### Create New Version of a Platform Blueprint
From the side menu navigate to`Modeling` > `Platform Blueprint`, this will display a list of existing Platform Blueprints. Click on the `Actions` drop-down in the top right-hand corner of the Platform Blueprint we want to view/edit and select `Open`. This will open the Platform Blueprint in the `Platform Editor` in view mode.

To create a new version of a Platform Blueprint, ensure the correct version of the Platform Blueprint is selected in the `Control Bar` then click on the `Actions` drop-down and select `Save as new version` (outlined in red below).

![](img/platformBlueprintSaveAsNewVersion.png)

This will open the `New Platform Blueprint Version` dialogue. This will confirm the selected Platform Blueprint and version that we are going to base our new version on. 

![](img/newPlatformBluePrintVersion.png)

Here we need to specify the version number for our new Platform Blueprint. In addition, we can specify some notes that detail the reason for the new version. These notes will appear in the version history for any Platform Instance once updated to this version of the Platform Blueprint.

Once complete, click `Save`. This will create the new version of our Platform Blueprint and return us to the `Platform Editor`. Here we can see that the `Control Bar` displays the version (outlined in red below) of our new Platform Blueprint and that it has a status of `DRAFT`.

![](img/newPlatformBluePrintVersionStep2.png)

#### Adding a Data Source
Click on `Edit Configuration`. In the tree view expand the domain and click on the `+` icon next to JDBC Data Sources (outlined in red). This will create a new Data Source, `Jdbc Data Source - 13` in the example below.

Select the new data source in the tree view, MyST will display it current configuration. We will see that initially none of its properties have been set.

> Note: An alternative way of creating a new Data Source is to select an existing data source, right click on it and select clone.

![](img/createDataSourceStep1.png)

Click on `Edit` to put the component into edit mode. For the purpose of our example, we will set the properties shown in the screen shot below.

![](img/createDataSourceStep2.png)

It's worth noting that we have used MyST properties to define the value of the following two properties.
* `Target` to the MyST property `${[rxr.wls.Cluster-1].name}` 
* `Username` to `${[rxr.def.Product-rcu].param[db-user-prefix]}_STOCK`

Click `Save` on the component.  We should now see that `Target` has been resolved to `osb_cluster` and that `Username` is left unresolved as `${[rxr.def.Product-rcu].param[db-user-prefix]}_STOCK`. This is because the RCU prefix will be set in our Platform Models and is not available from the Blueprint.

![](img/createDataSourceStep3.png)

Finally click `Save & Commit`.

### Update Platform Model

#### Create New Version of Platform Model
From the side menu navigate to`Modeling` > `Platform Models`, this will display a list of existing Platform Models. Select the Platform Model to be updated. MyST will display summary details about the Platform Model and its corresponding Platform Instance. Click on the `Actions` drop-down in the top right-hand corner and select `Configuration`. This will open the Platform Model in the `Platform Editor` in view mode.

By default, MyST will open the Platform Model for the **previous** version of the Platform Blueprint. In the `Control Bar` select the Platform Blueprint **version** created in the previous step.

![](img/createNewModel.png)

The `Platform Editor` will highlight that there is no model currently defined for that version of the Platform Blueprint. Click `Create` (outlined above). 

This will open the `New Platform Model Version` dialogue. This will confirm the selected Platform Blueprint version that we are going to create our new Model for. Next, we need to select from the drop down an existing `Platform Model` we want to base our new model on. This is usually the most recent version.

Finally provide some notes that detail the reason for the new Platform Model.

![](img/createNewModelStep2.png)

Once complete, click `Save`. This will create the new version of our Platform Model and return us to the `Platform Editor`. Here we can see that the `Control Bar` displays the version of our new Platform Model and that it has a status of `DRAFT`.

#### Add environment specific details to our Platform Model
Click on `Edit Configuration`. In the tree view expand the domain and then expand the list of Data Sources within our domain. We can see that it includes the data source that we added to our Platform Blueprint.

Select the new data source in the tree view, MyST will display it current configuration as defined in the Platform Blueprint. We should now see that `Username` has been resolved to `CI_STOCK`, this is because the RCU prefix is set in our Platform Model.

![](img/modelDataSourceStep1.png)

The only values we need to specify for our Data Source in the Platform Model are:
* **Database URL** - This is the URL for the database that we want our Data Source to connect to. 
* **Password** - This is the password for corresponding `Username` for connecting to the database.

> Note: All stored passwords are first encrypted by MyST.

Click on `Edit Configuration` and enter these values. 

![](img/modelDataSourceStep2.png)

Once done, click `Save` to save these values within the Data Source and then click `Save & Commit` to save the Platform Model and commit our changes.

### Performing a Dry Run
We are now ready to update our Platform Instance with its additional configuration. When we run a platform update, we have the option of specifying whether we first want to perform a dry run. 

With a dry run, MyST doesn't perform the actual changes, rather it goes through the process of determining what changes need to be applied (in exactly the same way it does when making the actual changes) and then produces a report detailing the changes that will be made.

This allows us to quickly validate the changes to be applied are as expected, and if not, go back and make the appropriate corrections to our Platform Blueprint and or Platform Model.

From the side menu navigate to`Modeling` > `Platform Models`, this will display a list of existing Platform Models. Select the Platform Model to be updated. MyST will display summary details about the Platform Model and its corresponding Platform Instance.

We can see, that under `Versions` a list of Platform Model versions. Looking at the `Instance Details` we can see that the Platform Instance is currently on version`1.0.0` of the Platform Blueprint\Model.

![](img/dryrunAction.png)

Click on the `Actions` drop-down and select `Update`, MyST will open the Platform Instance Update dialogue.

![](img/dryrunUpdate.png)

For the `Update type` select the option to `Update to higher version` and from the dropdown select the new version of our Platform Model.

Next, ensure the check-box `Do a dry run` has been selected. Lastly, enter any updated notes and then click `Update`. MyST will initiate the Dry run and return us to the summary view of the Platform Model and Instance.

![](img/dryrunComplete.png)

Once the Dry run has completed, click on `View` (outlined above) under `Execution log`. This will open a window showing the result of the Dry run, as shown below.

This will show details of all the changes that will be made when we execute an actual update.

![](img/dryrunResult.png)

### Perform Platform Instance Update
The process for performing an update against the Platform Instance to apply the changes in our Platform Blueprint / Model is the same as performing a Dry run. Only this time ensure the check-box `Do a dry run` has **not** been selected.

Once we have initiated the update, MyST will return us to the summary view of the Platform Model and Instance where we should see the update in progress. Once completed, the `Provisioned version` under `Instance Details` will now show the new version of the Platform Model.

![](img/updatePlatformComplete.png)

If we click `View` under `Execution log`. This will open a window showing the execution log for the update, as shown below.

![](img/updatePlatformLog.png)

> Note: Whilst in this example the configuration change that we applied was to add a new data source, we would follow an identical approach to modify an existing data source. The only difference being that we would update an existing data source configuration in the Platform Blueprint. MyST will determine and perform the required steps to apply the necessary changes.

See [Part 4 - Platform Configuration](../../part4/part4.md) for details on how define other configuration requirements within a Platform Blueprint / Model.