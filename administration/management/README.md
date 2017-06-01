# {{ page.title }}

<!-- toc -->

Under the `bin` directory (eg. `/opt/myst-studio/bin`) of the MyST Studio home, is a number of utility scripts described below. Updates to the management scripts will be made available in the Release Notes on the MyST Studio website. Typically, they will not change often.

### Scripts
| MyST Studio Script | Description |
|---|---|
| `pull.sh` | Pulls the MyST Studio container from the Public MyST Docker Registry using the customer key and tags it as myst-studio.<br><br>If internet access is not available from the MyST Studio host this will need to be performed manually by downloading the Docker image from the MyST website and performing the following steps:<br>`docker load -i <MyST Studio Docker Image>`<br>`docker tag <Image Name> myst-studio` |
| `backup-database.sh` | Performs a backup of the database to MyST Studio home under the backup directory with a datetime suffix. The location is printed to the output. For example:<br>`Backed up to /opt/myst-studio/backup/myst-studio-1468979016.sql`<br><br>Take note of the location as you will require this later if you intend to perform a rollback. |
| `update-database.sh` | Updates/Restores the MyST Studio database from a previous backup as follows:<br>`./update-database.sh <path to previous backup file>`<br><br>Before updating the database, the MyST Studio web container will be shutdown and then started up after the database update is complete. |
| `stop.sh`	| Stops the MyST Studio instances |
| `start.sh`	| Starts the MyST Studio instances.<br><br>On boot, the MyST Studio web instance will upgrade the database if `pull.sh` was previously run. |
| `output-logs.sh` | This displays the MyST Studio start up logs during startup.  This can be closed by typing Ctrl+C. |
| `upgrade.sh` | Upgrade to a specific version of MyST Studio as follows:<br>`./upgrade.sh <Version>`<br><br>If the <Version> argument is it omitted it will upgrade to the latest version. The version pulled down will be tagged as "myst-studio".<br>`docker tag myst-studio myst-studio:<Version>`<br>{% hint style='info' %}<br>If pulling down the latest version, it is a good practise to tag a specific version number to assist with rollback.{% endhint %}<br><br>The following steps will be performed as part of the upgrade script:<br>1. Download of the desired MyST Studio version<br>2. Backup of the database<br>3. Restart of MyST Studio components |

### Advanced Scripts
| MyST Studio Script | Description |
|---|---|
| **`build-and-deploy-new-agent.sh` | Updating MyST Studio to use a different agent. This may be useful if you want to try out a new agent first, without upgrading MyST Studio.<br><br>To use this script, you must have the MyST agent existing at the MyST Studio home under lib/myst-impl.zip prior to exection (e.g. `/opt/myst-studio/lib/myst-impl.zip`) |
| `build-data-container.sh` | This script will build the data container which holds the MyST license and SSL Certificate and Key. This is typically a one-off task that is performed after installation.<br><br>To **update the SSL keys or license** re-run this script after placing the new files in the respective locations under the MyST Studio HOME: <br>`conf/data/license/MyST.lic`<br>`conf/data/nginx/ssl/cert.crt`<br>`conf/data/nginx/ssl/cert.crt`<br><br>If MyST Studio is running while this is executed, a restart will be required to take effect. |
| `dump-logs.sh` | Dumps all of the MyST Studio logs to a file. Handy for raising support tickets. It will output the location of the logs. For example:<br>`Logs have been output to /opt/myst-studio/logs/myst-studio-1468994415.txt` |
| **`pull-snapshot.sh` | This script is similar to `pull.sh` however, it allows for pulling down experimental snapshots of MyST Studio. |

{% hint style='info' %}
**Advanced usage only. Ensure you are familiar with the scripts before running these.
{% endhint %}


