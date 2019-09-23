# {{ page.title }}

{% hint style='danger' %}
Generally, it is recommended that MyST be installed on Docker. This will enable the easiest rollout process of MyST and it's associated components as well as allowing for effortless upgrades. As new releases of MyST are shipped regularly, being able to upgrade in seconds is a desirable trait of the system. For details on installing MyST with Docker please visit [this link](../README.md).
{% endhint %} 

Recommendations aside, it is important to recognise there can be some internal constraints within an organization which prevents the use of Docker, at least in the short-term. This guide is designed for such scenarios.

## Enterprise constraints preventing use of Docker

An enterprise may lag behind high-performing companies for various reasons. Below are a list of common constraints in an enterprise that may prevent the use of Docker.

 * **Unable to use up-to-date kernel**
   Docker requires a new-*ish* kernel version. Enterprises may have a Standard Operating Environment (SOE) and may not be ready to upgrade their Linux kernel to support Docker. Please refer to the [Docker documentation](https://docs.docker.com/engine/installation) for your specific Operating System to determine the kernel version required.

 * **Require out-of-date Docker version**
   This is related to the previous point. If an organisation's SOE prevents the use of an up-to-date kernel then there may be a need to install an older version of Docker. Alternatively, an organisation may have an out-of-date Operating System package manager responsible for delivering out-of-date Docker versions to an operation system.
 
   MyST relies on the [v2 compose file format](https://docs.docker.com/compose/compose-file/compose-file-v2/) meaning that it will not work with earlier versions of Docker. If you wish to use an earlier version of Docker, please raise a [support ticket](http://support.rubiconred.com) for assistance in configuring MyST to work with earlier versions of Docker.
      
 * **Waiting on a purchasing decision**
   Organisation's may choose to use RedHat or Oracle Linux. Since version 17.3+,  Docker Enterprise Edition (EE) must be licensed for  Red Hat / Oracle Linux. 
 
   In this case, an organisation can choose to use Docker Community Edition (CE) with non-RedHat / Oracle Linux operating systems such as the RedHat-based CentOS or other Linux derivatives such as Ubuntu. If an organisation is not willing to license EE, downgrade Docker or use a CE supporting operating system, Docker may no longer be a viable option.
 
This document exists for edge cases where an alternative means for installing MyST Studio is required. While the Docker-based installation can take minutes, the manual installation could take several hours and should be followed as a late resort only.

# Install MyST Studio Manually (without Docker)

MyST can be installed to run without Docker through a three step process.
1. Install MySQL
2. Install MyST on a Docker supporting system to extract the MyST application and configuration or download the MyST zip bundle directly.
3. Copy the extracted MyST application and configuration to the non-Docker host and wire it to the MySQL database.

## Install MySQL Community Edition

MyST Studio uses MySQL Community Edition 5.7.15 to store its data. Before we install MyST Studio we must ensure that a running instance of MySQL is available and configured. General MySQL installation details can be found [here](http://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html
)

1. Download the yum repo file that is needed for the specific target operating system.
   The available repo file for RedHat/Oracle Linux based systems are listed [here](http://dev.mysql.com/downloads/repo/yum/) so you download to the box with a command line this: 
   `wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm`

2. Install the repo
   `sudo yum localinstall mysql57-community-release-el6-9.noarch.rpm
`
   
3. Install MySQL Community Edition 5.7.15
   `sudo yum install mysql-community-server
`
     
4. Start MySQL
  `sudo service mysqld start
`
  
5. Verify that it is running
   `sudo service mysqld status
   mysqld (pid  1340) is running...
`
   
6. At the initial start-up of the server, the following happens, given that the data directory of the server is empty:
    * The server is initialized.
    * An SSL certificate and key files are generated in the data directory.
    * The validate_password plugin is installed and enabled.
    * A superuser account `'root'@'localhost` is created. A password for the superuser is set and stored in the error log file. To reveal it, use the command described in the next step.
    
7. Get the super user password
   `sudo grep 'temporary password' /var/log/mysqld.log`
   
8. Change the root password as soon as possible by logging in with the generated, temporary password and set a custom password for the superuser account. 

MySQL's validate_password plugin is installed by default. This will require that passwords contain at least one upper case letter, one lower case letter, one digit, and one special character, and that the total password length is at least 8 characters.
   
   The default MyST password is not allowed by the password validation. You may choose to remove that module and set it to the default MyST password
 (`welcome1`).
   
   ```
   mysql -uroot -p 
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
   uninstall plugin validate_password;
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'welcome1';
   ```
   
9. Create the `fusioncloud` schema and user
   ```
   CREATE USER 'fusioncloud'@'localhost' IDENTIFIED BY 'welcome1';
   CREATE DATABASE fusioncloud;
   GRANT ALL PRIVILEGES ON fusioncloud.* to 'fusioncloud'@'localhost' WITH GRANT OPTION;
   ```
10. Increase MySQL max allowed packet by editing `/etc/my.cnf` with the following under `[mysqld]` section
    ```
    [mysqld]
    max_allowed_packet = 256M
    ```

## Obtain the MyST product

### Option 1: Download the MyST Studio zip bundle

After login at [myst.rubiconred.com](https://myst.rubiconred.com), you will be able to download the MyST Studio zip bundle from the following link `https://myst.rubiconred.com/webhelp/installer/release/tomcat-myststudio-bundle-$VERSION.tar.gz`. Be sure to replace `$VERSION` with the actual version number.

### Option 2: Obtain the MysT Studio zip bundle from the Docker image

To keep the MyST installation in line with what is built and delivered as part of the Docker image for MyST, we obtain a non-Docker copy of MyST product by first installing MyST on a machine which supports Docker, followed by retrieving the MyST file system and copying it to a non-Docker host. This will involve installing Docker on a supporting operating system and pulling down a specific version of a docker image for MyST, followed by creating a tar achive of the tomcat directory with the related MyST application and configuration. For information on Docker and MyST Studio installation refer to 
 *[Docker install](https://docs.docker.com/engine/installation/) for your operating system version
 *[MyST Studio installation](/myst-studio/installation/myst-studio/).
1. Once MyST and Docker are installed, retrieve the desired image
   ```
   cd /opt/myst-studio/bin
   ./pull
   ``` 
2. Obtain the image name for MyST. You can see a list of Docker images on the host by running `docker images` that will yiel an output similar to:
   ```
   REPOSITORY                                               TAG    IMAGE ID     CREATED     SIZE
   067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio latest 91c4a4f58d2c 4 weeks ago 484.3 MB
    ```
3. Start a container from the MyST Studio docker image using:
   ```
   docker run -ti --name myststudio-tomcat <image name>:<tag> /bin/bash 
   ```
   where `<image name>:<tag>` is obtained from previously running the `docker images` command

4. Tar the contents of the tomcat directory by first entering the container. For example:
   ```
   docker run -ti --name myststudio-tomcat 067343992071.dkr.ecr.us-west-2.amazonaws.com/myst-studio:5.0.1.1 /bin/bash
   ```
   Then, once inside the Docker container run:
   ```
   cd /usr/local
   tar -zcvf tomcat-myststudio.tar.gz tomcat
   exit
   ```
   Your container will shutdown as soon as you exit it.

4. Copy the tomcat-myststudio.tar.gz out of the shutdown docker container.
   ```
   docker cp myststudio-tomcat:/usr/local/tomcat-myststudio.tar.gz .
   ```

## Install MyST Studio

1. Verify that the `JAVA_HOME` is set and the current `java` version is 1.7.
   When running `java -version` you should see an output similar to the following:
   ```
   OpenJDK Runtime Environment (IcedTea 2.6.7) (7u111-2.6.7-2~deb8u1)
   OpenJDK 64-Bit Server VM (build 24.111-b01, mixed mode)
   ```
2. Copy `tomcat-myststudio.tar.gz` to the MyST Studio server.
3. Extract the tar to `/opt/myst-studio`
   ```
   cd /opt/
   mkdir myst-studio
   tar -xvf /path/to/tomcat-myststudio.tar.gz -C myst-studio

   ```
4.  Add `"127.0.0.1   db"`  to `/etc/hosts` so that db resolves to `127.0.0.1`. Check that a `ping db` sends to `localhost`.
    ```
    sudo vi /etc/hosts
    127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 db
    ```

5.  Install the MyST license by copying the `MyST.lic` to `tomcat/conf/fusioncloud/license`
    ```
    mkdir -p /opt/myst-studio/tomcat/conf/fusioncloud/license
    cp MyST.lic /opt/myst-studio/tomcat/conf/fusioncloud/license
    ```
    The `MyST.lic` can be obtained from the MyST license bundle as follows:
    `tar -xf /path/to/MyST-*.lic.tar.gz MyST.lic`
6.  We need to change the tomcat port to 8085. Modify the following tag in `/opt/myst-studio/tomcat/conf/server.xml`.
    ```<Connector connectionTimeout="20000" port="8085" protocol="HTTP/1.1" redirectPort="8443"/>```
7.  To reflect the port change and allow authentication to work properly, update the following value in `/opt/myst-studio/tomcat/conf/fusioncloud/fc-configuration.properties`
    ```fc.oauth.endpoint=http://localhost:8085/fc```
8.  Update `/opt/myst-studio/tomcat/conf/context.xml` with the password you used the `fusioncloud` MySQL user.
9.  Set the java memory parameters by adding the following line to `/opt/myst-studio/tomcat/bin/catalina.sh`
    ```export JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms128m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=256m"```
10.  Start Tomcat as follows:
    ```/opt/myst-studio/tomcat/bin/startup.sh```
11. Access MyST Studio by going to `http://<host>:8085/console`

## Install MyST Studio as a service

MyST can be setup to run as a service so that it automatically starts up on system boot. The steps to do this different depending on the Operating System version.

### RedHat/OracleLinux/Centos distribution prior to 7

Take the below `myst` sysvinit script and place it in 
`/etc/rc.d/init.d`. Make sure that you update the paths to the MyST Studio installation location in the `start`, `stop` and `restart` actions if needed

``` 
#!/bin/bash
#
# /etc/rc.d/init.d/myst
#
# <description of the *service*>
# <any general comments about this init script>
#
# <tags -- see below for tag definitions. *Every line* from the top
# of the file to the end of the tags section must begin with a #
# character. After the tags section, there should be a blank line.
# This keeps normal comments in the rest of the file from being
# mistaken for tags, should they happen to fit the pattern.>

# chkconfig: 2345 95 05
# description: MyST Studio start script

# Source function library.
. /etc/rc.d/init.d/functions

case "$1" in
     start)
          echo -n "Starting MyST Studio services: "
          daemon --user=myst /opt/myst-studio/tomcat/bin/startup.sh
          touch /var/lock/subsys/myststudio
     ;;
     stop)
          echo -n "Shutting down MyST Studio services: "
          daemon --user=myst /opt/myst-studio/tomcat/bin/shutdown.sh
          rm -f /var/lock/subsys/myststudio
     ;;
     status)
                pid=`ps -eo pid,command | grep tomcat | grep -v grep | awk '{print $1}'`
                if [[ ! -z $pid ]] 
                then
                   echo "MyST Studio is running: $pid"
                else
                   echo "MyST Studio is not running"
                fi
     ;;
     restart)
                daemon --user=myst /opt/myst-studio/tomcat/bin/shutdown.sh
                daemon --user=myst /opt/myst-studio/tomcat/bin/startup.sh
     ;;
     reload)
     ;;
     probe)
     ;;
     *)
          echo "Usage: <servicename> {start|stop|status|restart}"
          exit 1
     ;;
esac
```
 
Now you should be able to start, stop and restart MyST Studio by
``` 
service myst start
service myst restart
service myst stop
```

### RedHat/OracleLinux/Centos distribution on 7+

7+ operating systems use `systemd` to manage services, and uses the concept of unit files. We place the unit file (called `myst.service`) in to `/etc/systemd/system/`.
 
Make sure that you update (if needed):
- The path to the MyST Studio installation
- The users who MyST Studio is supposed to run as (e.g. `myst`, `oracle`, etc.)

```
[Unit]
Description=MyST Studio
After=syslog.target network.target

[Service]
Type=forking
User=myst
ExecStart=/opt/myst-studio/bin/start.sh
ExecStop=/opt/myst-studio/bin/stop.sh

[Install]
WantedBy=multi-user.target
```

Set the correct file permissions
```
chmod 664 /etc/systemd/system/myst.service
```

Load the new service
```
systemctl daemon-reload
```

Make the service start a boot
```
systemclt enable myst
```

Start the MyST Studio now
```
systemctl start myst
```


## Automated installation reference

Below are the details steps for installing MyST from scratch on a RedHat/OracleLinux/Centos based machine on 7+. These steps are completely headless so are ideal for automating in a bash script or adapting for a Operating System Configuration Management tool of choice.

For the automated steps below, it is assumed that the following files are copied to `/usr/share/myst` and accessible (ideally owned) by the `myst` user. 
 - tomcat-myststudio-bundle-$VERSION.tar.gz
 - MyST.lic.tar.gz
 - myst.service

The steps below are designed to be performed by `root` user or by a user with `sudo` access.

### Setup MyST user group and path

```
groupadd -r myst
useradd -m -d /home/myst -s /bin/bash -g myst myst
mkdir -p /opt/myst-studio
chown -R myst:myst /opt/myst-studio
echo 'myst:myst' | sudo chpasswd
```

### Provide sudo access for myst (Optional)

```
echo "myst ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

### Install MySQL

```
wget http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum localinstall -y mysql57-community-release-el7-11.noarch.rpm
yum install -y mysql-community-server
```

### Start MySQL

```
service mysqld start
service mysqld status mysqld
```

### Configure MySQL

```
MYSQL_TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk 'NF>1{print $NF}')
MYSQL_ROOT_PASSWORD="welcome1"
MYSQL_FUSIONCLOUD_PASSWORD="welcome1"
mysql -uroot -p$MYSQL_TEMP_PASSWORD --connect-expired-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_TEMP_PASSWORD'; uninstall plugin validate_password; ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD --connect-expired-password -e "CREATE USER 'fusioncloud'@'localhost' IDENTIFIED BY '$MYSQL_FUSIONCLOUD_PASSWORD'; CREATE DATABASE fusioncloud; GRANT ALL PRIVILEGES ON fusioncloud.* to 'fusioncloud'@'localhost' WITH GRANT OPTION;"
echo "max_allowed_packet = 256M" >> /etc/my.cnf
```

### Install and Configure MyST Studio

Be sure to replace `MYST_VERSION` with your desired version.
```
MYST_VERSION="5.6.0.0"
cd /opt
mkdir myst-studio
tar -xvf /usr/share/myst/tomcat-myststudio-bundle-$MYST_VERSION.tar.gz -C myst-studio
mkdir /opt/myst-studio/bin
mkdir -p /opt/myst-studio/tomcat/conf/fusioncloud/license
cp /usr/share/myst/MyST.lic.tar.gz /opt/myst-studio/tomcat/conf/fusioncloud/license
# If you do not want to do this step....
sed -i.bak '/^127\.0\.0\.1/ s/$/ db/' /etc/hosts
# ...you can do this instead
sed -i.bak 's/db:/localhost:/' /opt/myst-studio/tomcat/conf/context.xml
sed -i.bak 's/8080/8085/' /opt/myst-studio/tomcat/conf/server.xml
sed -i.bak 's/8080/8085/' /opt/myst-studio/tomcat/conf/fusioncloud/fc-configuration.properties
# Begin workaround
histchars=
# This contains Jenkins params but the memory and UTF-8 args are for MyST Studio
printf "#!/bin/sh\nexport JAVA_OPTS=\"-DJENKINS_HOME=/opt/myst-studio/jenkins -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -Dfile.encoding=UTF-8 -Xms128m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=256m\"\n/opt/myst-studio/tomcat/bin/startup.sh" > /opt/myst-studio/bin/start.sh
unset histchars
# The above histchars unset is to workaround exclamation mark expansion in bash
# as described at https://stackoverflow.com/questions/15011824/how-to-printf-an-exclamation-mark-in-bash
# End workaround
ln -s /opt/myst-studio/tomcat/logs /opt/myst-studio/logs
ln -s /opt/myst-studio/tomcat/bin/shutdown.sh /opt/myst-studio/bin/stop.sh
chmod +x /opt/myst-studio/bin/start.sh
chown -R myst:myst /opt/myst-studio
```

### Install Jenkins (Optional)

Be sure to replace `JENKINS_VERSION` with your desired version.

```
JENKINS_VERSION="2.46.3"
wget https://updates.jenkins-ci.org/download/war/$JENKINS_VERSION/jenkins.war -P /opt/myst-studio/tomcat/webapps
mkdir -p /opt/myst-studio/jenkins
```

### Setup MyST Studio as a Service

```
cp /usr/share/myst/myst.service /etc/systemd/system/myst.service
chmod 664 /etc/systemd/system/myst.service
systemctl daemon-reload
systemctl enable myst
systemctl start myst
```
