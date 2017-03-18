# {{ page.title }}

New MyST features and bug fixes are frequently made available. Enterprises can easily upgrade their on-premise instance of MyST Studio by pulling down the latest version directly from the web or in-directly by downloading the associated Docker images and copying them up to the MyST host.

If you are a MyST customer, who started using MyST prior to 2016, you may still be using the MyST Command-Line Interface. For details on upgrading from MyST CLI to MyST Studio see the associated section within this guide.

## Upgrade Approaches

There are a number of different approaches that can be taken for upgrading MyST Studio. It is advisable to choose an approach that is appropriate for your organisations availability requirements. As the downtime during an upgrade is reduced the complexity of the upgrade generally increases. For that reason, the choice of upgrade approach is generally a trade off between reducing downtime and reducing complexity. The most common upgrade approaches are:

 * In-Place Upgrade: This involves upgrading a single instance of MyST Studio in-place. This will require a small downtime.
 * Phased Upgrade: This involves testing an upgrade on a non-production instance, before performing the upgrade on the production instance. This will still require a small downtime.
 * Zero Downtime Upgrade: This involves side-by-side upgrade of MyST Studio in order to reduce downtime or avoid it altogether.

### In-Place Upgrade

The simplest upgrade approach is to have a single instance which is upgraded in-place. This upgrade approach will require an outage.

#### Upgrade Steps
##### Step 1: Perform the upgrade

This can be executed by running the following on the MyST Studio host.

`/opt/myst-studio/bin/upgrade.sh <VERSION>`

<!-- TODO: Add TIP -->
This will require an outage of the MyST Studio instance. For a typical upgrade the outage should be no longer than 5 minutes.


| MyST Studio Script | Description |
|---|---|
| `/opt/myst-studio/bin/pull.sh` | Pulls the MyST Studio container from the Public MyST Docker Registry using the customer key and tags it as myst-studio. If internet access is not available from the MyST Studio host this will need to be performed manually by downloading the Docker image from the MyST website and performing the following steps. `docker load -i <MyST Studio Docker Image>` `docker tag <Image Name> myst-studio` |
| `/opt/myst-studio/bin/backup-database.sh` | Performs a backup of the database to MyST Studio home under the backup directory with a datetime suffix. The location is printed to the output. For example: `Backed up to /opt/myst-studio/backup/myst-studio-1468979016.sql` Take note of the location as you will require this later if you intend to perform a rollback. |
| `/opt/myst-studio/bin/stop.sh`	| Stops the MyST Studio instances
| `/opt/myst-studio/bin/start.sh`	| Starts the MyST Studio instances. On boot, the MyST Studio web instance will upgrade the database.
| `/opt/myst-studio/bin/output-logs.sh` |	This displays the MyST Studio start up logs during startup.  This can be closed by typing Ctrl+C. |

##### Step 2: Verify the upgrade

At a minimum, the following upgrade verification steps should be performed.
 * Check there are no errors shown in the MyST Studio start up log
 * Login to the MyST Studio console and check that the version shown in the bottom right-hand corner is correct. 

#### Rollback Steps

In the event of a failure during the upgrade the following steps can be performed to rollback the instance.

##### Step 1: Re-tag the old image
Find the previous version of the MyST Studio Docker Image. To see all version, you can execute the following:
```
docker images | grep myst-studio
```
Re-tag the image to be called "myst-studio". This will ensure on the next startup that the earlier version of MyST Studio is used. Below is an example for downgrade to MyST 3.9.0.3
```
docker tag 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:3.9.0.3 myst-studio
```
##### Step 2: Restore the database
This can be executed by running the following on the MyST Studio host.
```
/opt/myst-studio/bin/update-database.sh <Path to previous backup>
```
This step will perform an outage of the MyST Studio instance. This outage should be no longer than 5 minutes.
The following steps are performed as part of the database update.
1. The MyST Studio web instance is stopped.
2. The backup SQL is executed on the database
3. The MyST Studio web instance is started.
##### Step 3: Verify the downgrade
At a minimum, the following downgrade verification steps should be performed.
 * Check there are no errors shown in the MyST Studio start up log
 * Login to the MyST Studio console and check that the version shown in the bottom right-hand corner is correct. 

#### Pros / Cons

##### Pros:
 * Simple to setup
 * No need to manage the migration of data between instances

##### Cons:
 * Requires an outage to perform an upgrade
 * No way to test an upgrade prior to applying it

### Phased Upgrade

This approach involves the use of separate production and non-production instances. An upgrade is first tested on non-production before applying to production.

#### Upgrade Steps
##### Step 1: Download the latest version of MyST Studio
This can be executed by running the following command.
`/opt/myst-studio/bin/pull.sh <VERSION>`
If internet access is not available from the MyST Studio host this will need to be performed manually by downloading the Docker image from the MyST website and performing the following steps.
`docker load -i <MyST Studio Docker Image>`
`docker tag <Image Name> myst-studio`
##### Step 2: Take a copy of the latest production state and import to non-production (optional)
This step is optional if you wish to verify with the same instance data as production.
The involves first taking a copy of production database of MyST Studio by executing the following
/opt/myst-studio/bin/backup-database.sh
The location of the backup will be output to the terminal.
Next, the backup will need to be copied to the non-production host and the following will need to be executed.
/opt/myst-studio/bin/update-database.sh <Path to backup>
This step will shutdown and restart the MyST Studio web instance. Because we previously downloaded the latest MyST Studio, it will be upgraded to the latest MyST Studio version on startup.
##### Step 3: Upgrade MyST Studio
If you performed the previous step, then your instance should already be upgraded. If not you can upgrade the instance by doing a restart as follows:
/opt/myst-studio/bin/restart.sh
##### Step 4: Verify the upgrade on non-production
At a minimum, the following upgrade verification steps should be performed.
Check there are no errors shown in the MyST Studio start up log
Login to the MyST Studio console and check that the version shown in the bottom right-hand corner is correct. 
##### Step 5: If upgrade is successful, perform upgrade on production
This can be done from the production machine by executing the following:
`/opt/myst-studio/bin/upgrade.sh <VERSION>`
This will require an outage of the MyST Studio instance. For a typical upgrade the outage should be no longer than 5 minutes.
##### Step 6: Verify the upgrade on production
At a minimum, the following upgrade verification steps should be performed.
Check there are no errors shown in the MyST Studio start up log
Login to the MyST Studio console and check that the version shown in the bottom right-hand corner is correct. 
#### Rollback Steps
In the event of a failure during the upgrade the following steps can be performed to rollback the instance.
##### Step 1: Re-tag the old image
Find the previous version of the MyST Studio Docker Image. To see all version, you can execute the following:
docker images | grep myst-studio
Re-tag the image to be called "myst-studio". This will ensure on the next startup that the earlier version of MyST Studio is used. Below is an example for downgrade to MyST 3.9.0.3
`docker tag 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:3.9.0.3 myst-studio`
##### Step 2: Restore the database
This can be executed by running the following on the MyST Studio host.
`/opt/myst-studio/bin/update-database.sh <Path to previous backup>`
This step will perform an outage of the MyST Studio instance. This outage should be no longer than 5 minutes.
The following steps are performed as part of the database update.
The MyST Studio web instance is stopped.
The backup SQL is executed on the database
The MyST Studio web instance is started.
##### Step 3: Verify the downgrade
At a minimum, the following downgrade verification steps should be performed.
Check there are no errors shown in the MyST Studio start up log
Login to the MyST Studio console and check that the version shown in the bottom right-hand corner is correct. 
#### Pros / Cons
##### Pros:
* Allows for an upgrade to be tested before introducing it to production
* Provides a sandbox for testing configuration prior to moving to production
##### Cons:
* Requires an outage to perform an upgrade
* If not using the same data as production (i.e. skipping step 2), it may not be an accurate upgrade verification for production.
* More complex to setup than single instance

### Zero Downtime Upgrade

...

## Upgrading from CLI to Studio

...

