# {{ page.title }}

{% hint style='danger' %}
Generally, it is recommended that MyST be installed on Docker. This will enable the easiest rollout process of MyST and it's associated components as well as allowing for effortless upgrades. As new releases of MyST are shipped regularly, being able to upgrade in seconds is a desirable trait of the system. For details on installing MyST with Docker please visit [this link](README.md).
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
2. Install MyST on a Docker supporting system to extract the MyST application and configuration.
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

## Obtain the MyST product from a Docker installation.

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
    cp MyST.lic /opt/app/myst-studio/tomcat/conf/fusioncloud/license
    ```
    The `MyST.lic` can be obtained from the MyST license bundle as follows:
    `tar -xf /path/to/MyST-*.lic.tar.gz MyST.lic`
6.  We need to change the tomcat port to 8085. Modify the following tag in `/opt/myst-studio/tomcat/conf/server.xml`.
    ```<Connector connectionTimeout="20000" port="8085" protocol="HTTP/1.1" redirectPort="8443"/>```
7.  To reflect the port change and allow authentication to work properly, update the following value in `/opt/app/myst-studio/tomcat/conf/fusioncloud/fc-configuration.properties`
    ```fc.oauth.endpoint=http://localhost:8085/fc```
8.  Update `/opt/myst-studio/tomcat/conf/context.xml` with the password you used the `fusioncloud` MySQL user.
9.  Set the java memory parameters by adding the following line to `/opt/app/myst-studio/tomcat/bin/catalina.sh`
    ```export JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms128m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=256m"```
10.  Start Tomcat as follows:
    ```/opt/app/myst-studio/tomcat/bin/startup.sh```
11. Access MyST Studio by going to `http://<host>:8085/console`