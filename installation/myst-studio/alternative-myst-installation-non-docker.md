# Recommended Approach: Docker

Generally, it is recommended that MyST be installed on Docker. This will enable the easiest rollout process of MyST and it's associated components as well as allowing for effortless upgrades. As new releases of MyST are shipped regularly, being able to upgrade in seconds is a desirable trait of the system. For details on installing MyST with Docker please visit [this link](/myst-studio/installation/myst-studio/). 

Recommendations aside, it is important to recognise there can be some internal constraints within an organization which prevents the use of Docker, at least in the short-term.

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

TODO: Add steps here 

## Install MySQL Community Edition

MyST Studio use MySQL Community Edition 5.7.15 to store its data. Before we install MyST Studio we must ensure that a running instance of MySQL is available and configured. General MySQL installation details can be found [here](http://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html)

1. Download the yum repo file that is needed for the specific target operating system.
   The available repo file for RedHat/Oracle Linux based systems are listed [here](http://dev.mysql.com/downloads/repo/yum/) so you download to the box with a command line this: 
   `wget http://dev.mysql.com/get/mysql57-community-release-el6-9.noarch.rpm`

2. Install the repo
   `sudo yum localinstall mysql57-community-release-el6-9.noarch.rpm`
   
3. Install MySQL Community Edition 5.7.15
   `sudo yum install mysql-community-server`
     
4. Start MySQL
  `sudo service mysqld start`
  
5. Verify that it is running
   `sudo service mysqld status
   mysqld (pid  1340) is running...`
   
6. At the initial start-up of the server, the following happens, given that the data directory of the server is empty:
    * The server is initialized.
    * An SSL certificate and key files are generated in the data directory.
    * The validate_password plugin is installed and enabled.
    * A superuser account `'root'@'localhost` is created. A password for the superuser is set and stored in the error log file. To reveal it, use the command described in the next step.
    
7. Get the super user password
   `sudo grep 'temporary password' /var/log/mysqld.log`
   
8. Change the root password as soon as possible by logging in with the generated, temporary password and set a custom password for the superuser account. MySQL's validate_password plugin is installed by default. This will require that passwords contain at least one upper case letter, one lower case letter, one digit, and one special character, and that the total password length is at least 8 characters.
   
   The default MyST password is not allowed by the password validation. You may choose to remove that module and set it to the default MyST password (`welcome1`).
   
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
   
   TODO: Add how to change the MyST database installation user