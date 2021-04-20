# {{ page.title }}

<!-- toc -->

Under the `bin` directory (eg. `/opt/myst-studio/bin`) of the Myst Studio home, is a number of utility scripts described below. Updates to the management scripts will be made available in the Release Notes on the Myst Studio website. Typically, they will not change often.

### Scripts
| Myst Studio Script | Description |
|---|---|
| `pull.sh` | Pulls the Myst Studio container from the Public Myst Docker Registry using the customer key and tags it as myst-studio.<br><br>If internet access is not available from the Myst Studio host this will need to be performed manually by downloading the Docker image from the Myst website and performing the following steps:<br>`docker load -i <Myst Studio Docker Image>`<br>`docker tag <Image Name> myst-studio` |
| `backup-database.sh` | Performs a backup of the database to Myst Studio home under the backup directory with a datetime suffix. The location is printed to the output. For example:<br>`Backed up to /opt/myst-studio/backup/myst-studio-1468979016.sql`<br><br>Take note of the location as you will require this later if you intend to perform a rollback. |
| `update-database.sh` | Updates/Restores the Myst Studio database from a previous backup as follows:<br>`./update-database.sh <path to previous backup file>`<br><br>Before updating the database, the Myst Studio web container will be shutdown and then started up after the database update is complete. |
| `stop.sh`	| Stops the Myst Studio instances |
| `start.sh`	| Starts the Myst Studio instances.<br><br>On boot, the Myst Studio web instance will upgrade the database if `pull.sh` was previously run. |
| `output-logs.sh` | This displays the Myst Studio start up logs during startup.  This can be closed by typing Ctrl+C. |
| `upgrade.sh` | Upgrade to a specific version of Myst Studio as follows:<br>`./upgrade.sh <Version>`<br><br>If the <Version> argument is it omitted it will upgrade to the latest version. The version pulled down will be tagged as "myst-studio".<br>`docker tag myst-studio myst-studio:<Version>`<br>{% hint style='info' %}<br>If pulling down the latest version, it is a good practise to tag a specific version number to assist with rollback.{% endhint %}<br><br>The following steps will be performed as part of the upgrade script:<br>1. Download of the desired Myst Studio version<br>2. Backup of the database<br>3. Restart of Myst Studio components |

### Advanced Scripts
| Myst Studio Script | Description |
|---|---|
| **`build-and-deploy-new-agent.sh` | Updating Myst Studio to use a different agent. This may be useful if you want to try out a new agent first, without upgrading Myst Studio.<br><br>To use this script, you must have the Myst agent existing at the Myst Studio home under lib/myst-impl.zip prior to exection (e.g. `/opt/Myst-studio/lib/myst-impl.zip`) |
| `build-data-container.sh` | This script will build the data container which holds the Myst license and SSL Certificate and Key. This is typically a one-off task that is performed after installation.<br><br>To **update the SSL keys or license** re-run this script after placing the new files in the respective locations under the Myst Studio HOME: <br>`conf/data/license/MyST.lic`<br>`conf/data/nginx/ssl/cert.crt`<br>`conf/data/nginx/ssl/cert.crt`<br><br>If Myst Studio is running while this is executed, a restart will be required to take effect. |
| `dump-logs.sh` | Dumps all of the Myst Studio logs to a file. Handy for raising support tickets. It will output the location of the logs. For example:<br>`Logs have been output to /opt/myst-studio/logs/myst-studio-1468994415.txt` |
| **`pull-snapshot.sh` | This script is similar to `pull.sh` however, it allows for pulling down experimental snapshots of Myst Studio. |

{% hint style='info' %}
**Advanced usage only. Ensure you are familiar with the scripts before running these.
{% endhint %}


