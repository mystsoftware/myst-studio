# {{ page.title }}

<!-- toc -->

New Myst features and bug fixes are frequently made available. Enterprises can easily upgrade their on-premise instance of Myst Studio by pulling down the latest version directly from the web or in-directly by downloading the associated Docker images and copying them up to the Myst host.

> An upgrade of the Myst container will also include the latest patches for the underlying images which it is based off such as `tomcat` and the operating system which it is based off.

## Offline Upgrade

If you are unable to provide access to the Myst Docker Registry either directly or via Proxy Server, you will need to perform the upgrade process offline.

1. Download the [myst docker image](https://www.mystsoftware.com/resources/releases)
2. Run the following commands:

```shell
`cd /u01/myst-studio/bin`

# Backup the database
./backup-database.sh

# Import and tag the docker image
./import.sh myst-studio-docker-image-<version>.tar.gz

# Recreate the container during startup
./start.sh
```

## In-Place Upgrade

The simplest upgrade approach is to have a single instance which is upgraded in-place. This upgrade approach will require an outage of approximately 2 minutes.

### Upgrade Steps
#### Step 1: Perform the upgrade

This can be executed by running the following on the Myst Studio host.

`/opt/myst-studio/bin/upgrade.sh <VERSION>`

| Myst Studio Script | Description |
|---|---|
| `/opt/myst-studio/bin/pull.sh` | Pulls the Myst Studio container from the Public Myst Docker Registry using the customer key and tags it as myst-studio. If internet access is not available from the Myst Studio host this will need to be performed manually by downloading the Docker image from the Myst website and performing the following steps. `docker load -i <Myst Studio Docker Image>` `docker tag <Image Name> myst-studio` |
| `/opt/myst-studio/bin/backup-database.sh` | Performs a backup of the database to Myst Studio home under the backup directory with a datetime suffix. The location is printed to the output. For example: `Backed up to /opt/myst-studio/backup/myst-studio-1468979016.sql` Take note of the location as you will require this later if you intend to perform a rollback. |
| `/opt/myst-studio/bin/stop.sh`	| Stops the Myst Studio instances
| `/opt/myst-studio/bin/start.sh`	| Starts the Myst Studio instances. On boot, the Myst Studio web instance will upgrade the database.

#### Step 2: Verify the upgrade

At a minimum, the following upgrade verification steps should be performed.
 * Check there are no errors shown in the Myst Studio start up log
 * Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

### Rollback Steps

In the event of a failure during the upgrade the following steps can be performed to rollback the instance.

#### Step 1: Re-tag the old image
Find the previous version of the Myst Studio Docker Image. To see all version, you can execute the following:
```
docker images | grep myst-studio
```

Re-tag the image to be called "myst-studio". This will ensure on the next startup that the earlier version of Myst Studio is used. Below is an example for downgrade to Myst 3.9.0.3
```
docker tag 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:7.0.0 myst-studio
```

#### Step 2: Restore the database
This can be executed by running the following on the Myst Studio host.
```shell
cd /opt/myst-studio/bin
./update-database.sh <Path to previous backup>
./restart.sh
```
This step will perform an outage of the Myst Studio instance. This outage should be no longer than 5 minutes.
The following steps are performed as part of the database update.
1. The Myst Studio web instance is stopped.
2. The backup SQL is executed on the database
3. The Myst Studio web instance is started.

#### Step 3: Verify the downgrade
At a minimum, the following downgrade verification steps should be performed.
 * Check there are no errors shown in the Myst Studio start up log
 * Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

## Phased Upgrade

This approach involves the use of separate production and non-production instances. An upgrade is first tested on non-production before applying to production.

### Upgrade Steps

#### Step 1: Download the latest version of Myst Studio
This can be executed by running the following command.
`/opt/myst-studio/bin/pull.sh <VERSION>`
If internet access is not available from the Myst Studio host this will need to be performed manually by downloading the Docker image from the Myst website and performing the following steps.
```shell
cd /opt/myst-studio
./import.sh <Myst Studio Docker Image>.tar.gz
```

#### Step 2: Take a copy of the latest production state and import to non-production (optional)
This step is optional if you wish to verify with the same instance data as production.
The involves first taking a copy of production database of Myst Studio by executing the following
/opt/myst-studio/bin/backup-database.sh
The location of the backup will be output to the terminal.
Next, the backup will need to be copied to the non-production host and the following will need to be executed.
`/opt/myst-studio/bin/update-database.sh <Path to backup>`
This step will shutdown and restart the Myst Studio web instance. Because we previously downloaded the latest Myst Studio, it will be upgraded to the latest Myst Studio version on startup.

#### Step 3: Upgrade Myst Studio
If you performed the previous step, then your instance should already be upgraded. If not you can upgrade the instance by doing a restart as follows:
`/opt/myst-studio/bin/restart.sh`

#### Step 4: Verify the upgrade on non-production
At a minimum, the following upgrade verification steps should be performed.
Check there are no errors shown in the Myst Studio start up log
Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

#### Step 5: If upgrade is successful, perform upgrade on production
This can be done from the production machine by executing the following:
`/opt/myst-studio/bin/upgrade.sh <VERSION>`
This will require an outage of the Myst Studio instance. For a typical upgrade the outage should be no longer than 5 minutes.

#### Step 6: Verify the upgrade on production
At a minimum, the following upgrade verification steps should be performed.
Check there are no errors shown in the Myst Studio start up log
Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

### Rollback Steps
In the event of a failure during the upgrade the following steps can be performed to rollback the instance.

#### Step 1: Re-tag the old image
Find the previous version of the Myst Studio Docker Image. To see all version, you can execute the following:
docker images | grep myst-studio
Re-tag the image to be called "myst-studio". This will ensure on the next startup that the earlier version of Myst Studio is used. Below is an example for downgrade to Myst 3.9.0.3
`docker tag 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:3.9.0.3 myst-studio`

#### Step 2: Restore the database
This can be executed by running the following on the Myst Studio host.
`/opt/myst-studio/bin/update-database.sh <Path to previous backup>`
This step will perform an outage of the Myst Studio instance. This outage should be no longer than 5 minutes.
The following steps are performed as part of the database update.
The Myst Studio web instance is stopped.
The backup SQL is executed on the database
The Myst Studio web instance is started.

#### Step 3: Verify the downgrade
At a minimum, the following downgrade verification steps should be performed.
Check there are no errors shown in the Myst Studio start up log
Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

## Zero Downtime Upgrade

With this upgrade strategy, there is two instances (blue and green). At any given time, the DNS record will point to one of the two instances. This allows for an upgrade to be performed on the non-active instance in isolation and once ready, the DNS record can be updated to point traffic to this instance. This approach has the benefit of there not being any outage required when performing the upgrade.

### Upgrade Steps
Below are the steps for upgrading our green instance and switching over from our blue instance. If our green instance were the active instance we would reverse blue and green in the below steps.

#### Step 1: Download the latest version of Myst Studio on the green instance
This can be executed by running the following command.
`/opt/myst-studio/bin/pull.sh <VERSION>`

#### Step 2: Set blue repository to read-only (optional)
Prior to upgrading the instance, we will take an export of our blue instance database. During this period, if a user were to make a change on the blue instance it would be lost when we switch over to the green instance. In order to prevent changes, you may wish to make the blue repository read-only as follows:
```
docker exec -ti myststudio_db mysql -u root -pwelcome1
mysql> FLUSH TABLES WITH READ LOCK;
mysql> SET GLOBAL read_only = ON;
mysql> exit
```

#### Step 3: Take a copy of the latest blue instance state and import to the green instance
The involves first taking a copy of blue database of Myst Studio by executing the following
`/opt/myst-studio/bin/backup-database.sh`
The location of the backup will be output to the terminal.
Next, the backup will need to be copied to the green host and the following will need to be executed.
`/opt/myst-studio/bin/update-database.sh <Path to backup>`
This step will shutdown and restart the Myst Studio web instance. Because we previously downloaded the latest Myst Studio, it will be upgraded to the latest Myst Studio version on startup.
Be sure to disable the read only mode on the database by executing the following:
```
docker exec -ti myststudio_db mysql -u root -pwelcome1
mysql> SET GLOBAL read_only = OFF;
mysql> UNLOCK TABLES;
mysql> exit
```

#### Step 4: Verify the upgrade on the green instance
At a minimum, the following upgrade verification steps should be performed.
Check there are no errors shown in the Myst Studio start up log
Login to the Myst Studio console and check that the version shown in the bottom right-hand corner is correct.

#### Step 5: If upgrade is successful, switch the DNS record to point to the green instance
This would simply involve updating the DNS record which is currently pointing to the blue instance so that it points to the green instance.
For the next upgrade, the DNS record will be pointed back to the blue instance.

### Rollback Steps
The rollback process is straight forward for Blue / Green. If an issue is encountered during the upgrade process then it won't impact the active instance so there is no rollback required other than setting the instance back from read-only if this was set.
