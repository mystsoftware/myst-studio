## {{ page.title }}

Within MyST, **Hosts** are the logical representation of the Virtual, Physical or Container-based instances that host one or more WebLogic Server instances. MyST allows the use of pre-existing hosts or for new hosts to be delivered on-demand.

* **Pre-existing Hosts:** MyST can use pre-existing Virtual, Physical or Container-based hosts as the target for hosting Oracle Middleware platforms. With this approach, MyST is dependent on a system administrator or a Configuration Management solution like Puppet or Chef to pre-configure the host before it is used as a target by MyST 
* **On-demand Cloud Providers:** MyST can spin up its own infrastructure using a Cloud provider. This approach relies upon a machine image which is used as a template for the Virtual Machines that are created to underpin the Oracle Middleware platforms

### Pre-Configuring Hosts
In Unix/Linux, root is the account that by default has access to all commands and files on the operating system. It is a heavily guarded privilege which of course should not be given out lightly. MyST keeps it simple and does not need any root privileges to roll out Oracle Middleware platforms. By default, MyST will assume that root-privileged actions have already been performed on the host by a system administrator at the time that it uses the hosts for provisioning.

{% hint style='tip' %}
When using a Cloud provider such as Amazon Web Services, an administrator or automation tool can pre-configure a Linux host with the root-privileged actions and create a template. That way, when MyST provisions Oracle Middleware platforms from scratch on a Cloud, it can use the template as the basis for the Linux hosts. This means that the root privileged actions only need to be performed once which improves security, reduces effort and results in consistent base Linux hosts for all Oracle Middleware platforms.
{% endhint %}

### Pre-Configuring Middleware Host
A target Linux host for Oracle Middleware typically requires root privileges to set up a number of prerequisite operating system dependencies. As such, these dependencies are often best addressed by a privileged user or tool prior to using MyST Studio to provision Oracle Middleware on to them. These dependencies are as follows:

* Verify that your operating system is certified and properly configured for installation and configuration.
* Install a certified Java JDK
* Verify that the installation user has the proper permissions to install and configure the software.
* Verify that you can create the necessary directories for installation and configuration, according to the recommended directory structure.
* Make the Oracle installation binaries available

#### Operating System Requirements
The following section provides a high-level overview of the minimum system requirements that need to be put in place prior to installing Oracle Fusion Middleware. You should consult the corresponding Oracle Fusion Middleware system requirements documentation to ensure that your environment meets the requirements. 

* [Oracle Fusion Middleware 12.2.1](http://docs.oracle.com/cd/E23104_01/sysreqs1221/sysrs.htm)
* [Oracle Fusion Middleware 12.1.3](http://docs.oracle.com/cd/E23104_01/sysreqs1213/sysrs.htm)
* [Oracle Fusion Middleware 11.1.1.x](http://docs.oracle.com/html/E18558_01/fusion_requirements.htm)

**Note**: These documents cover the minimum requirements for the Oracle products you are installing and details hardware and software requirements, database schema requirements, minimum disk space and memory requirements, and required system libraries, packages, or patches.

##### Enabling Unicode Support
Oracle recommends that you enable Unicode support by setting the LANG and LC_ALL environment variables to a locale with the UTF-8 character set. This enables the operating system to process any character in Unicode.

| Variable | Description |
| -------- | ----------- |
| LANG | This environment variable sets the installation default locale. For example: `setenv LANG en_US.UTF-8` |
| LC_ALL | This environment variable overrides the value of the LANG environment variable and the values of any other LC_* environment variables. For example: `setenv LC_ALL en_US.UTF-8` |


##### Setting Open File and Processes Limit
Add the following lines to the file `/etc/security/limits.conf`

```
* soft  nofile  4096
* hard  nofile  65536
* soft  nproc   2047
* hard  nproc   16384
```
The nofiles values represent the open file limit; the nproc values represent the number of processes limit.

If you are running **Oracle Linux 6** or **Red Hat Linux 6**. Make sure the same values are defined in the file `/etc/security/limits.d/90-nproc.conf` as these can override the values in the `limits.conf` file.

##### Verify the required packages on the target hosts
The following table lists the packages that must be available on the target hosts where you want to install MyST Studio. It is recommended that you consult the Oracle Fusion Middleware system requirements documentation to confirm the exact version of these packages needed by the version of Oracle Middleware being installed.

| Package Name |
| -- |
| binutils |
| compat-libcap1 |
| compat-libstdc++-33.x86_64 |
| compat-libstdc++-33.i686 |
| gcc |
| gcc-c++ |
| glibc.x86_64 |
| glibc.i686 |
| glibc-devel.i686 |
| libaio-devel |
| libgcc |
| libstdc++.x86_64 |
| libstdc++.i686 |
| libstdc++-devel |
| make |
| sysstat |
| unzip |

Table 1. Packages required on the target hosts

The simplest way to ensure that all of the necessary packages are installed is to use the following commands:

```sh
sudo yum install oracle-rdbms-server-12cR1-preinstall
sudo yum install libstdc++-devel.i686
sudo yum install compat-libstdc++-33 compat-libstdc++-33.i686
```

##### Clock Synchronization
The clocks of all servers participating in the cluster must be synchronized to within one second difference to enable proper functioning of jobs, adapters, and Oracle B2B. 

To accomplish this, use a single network time server and then point each server to that network time server.


#### Install Java JDK

We must have a version of Java Hotspot installed on each target host. This is required by the MyST agent runtime (this dependency will be removed in a future version).

Open JDK is not supported by Fusion Middleware so be sure to use the Oracle JDK.

For more information see [Installing Java on Linux](https://java.com/en/download/help/linux_install.xml).

**Note 1**:  
* Oracle Fusion Middleware 12.2.1 requires Java 8  
* Oracle Fusion Middleware 12.1.3 and prior requires Java 7  

If you are planning on provisioning both Middleware versions on the same target hosts, ensure that both Java versions are installed and that you are referencing the correct Java home in your Platform Blueprint. This is covered in more detail in the Provisioning Section. 

**Note 2**:  
Due to a known issue with the MyST Studio SSH client, you need to create a symbolic link from `/usr/bin/java` to your actual java binary. For example, if your Java Home is at `/usr/java/latest`, run the following command on each host:

```sh
ln -s /usr/java/latest/bin/java /usr/bin/java
```

**Note 3**:  
There is a known bug in java that can impact the performance of the Weblogic Scripting Tool (WLST).  To workaround this issue, we need to edit the file `<java_home>/jre/lib/security/java.security`

1. Comment out the line:  
  `#securerandom.source=file:/dev/urandom`

2. Add the following line:  
  `securerandom.source=file:/dev/./urandom`


#### Configuring operating system users and groups
We need to create the operating system user that owns the Oracle software on each target host. 

When MyST installs the Oracle Middleware it will require Secure Shell (SSH) access to the target host. MyST supports user credentials provided either as password or as public key (see [Configuring Infrastucture Providers](/infrastructure/providers/pre-existing/README.md) for details).

##### Groups
We need to create the following groups on each target host:
* `oinstall`
* `dba`

##### Users
You must create the following users on each target host:

* `oracle` – The user that owns the Oracle software. You may use a different name[^1]. The primary group for this account must be oinstall. The account must also be in the dba group.

* `nobody` – An unprivileged user.

**Note**:
* Each group must have the same Group ID on every node.
* Each user must have the same User ID on every node.

To create oracle user and group, do the following:

```
sh
sudo /usr/sbin/groupadd oinstall
sudo /usr/sbin/groupadd dba
sudo /usr/sbin/useradd -m -g oinstall -G dba oracle
passwd oracle
```

The operating system user and group must have read and write access to the following directories: 
* `/u01/app/oracle`[^2]
* `/opt/myst`
* `/tmp/mystWorkspace`
 
**Important** - If any of these directories do not exist, please create them and make sure that the operating system user can read and write to them.

[^1] If you use a different name for the Oracle user or group, you must update the MyST global variables `oui.install.user` and `oui.install.group` in the Platform Blueprint.

[^2] `/u01/app/oracle` is the default base directory under which Oracle products are installed. If a different location is used, you must update the MyST global variable `oracle.base` in the Platform Blueprint.


##### Sudo Users
The following prerequisites are required in order to use the 'run as user' (sudo) in MyST.

1. The SSH user is configured in `/etc/sudoers` to allow sudo

2. The SSH user can execute `/bin/bash` as sudo user

3. Disable requiretty for the ssh user in /etc/sudoers (in this case `myst` SSH user):  
  `Defaults:myst !requiretty`

4. MyST executes following command:  
  `sudo -i -u <SUDO_USER> bash -c "<COMMAND>"`  
  
 **Note** - SUDO_USER being the SSH sudo user and COMMAND being the MyST command. This information is for troubleshooting purposes.


#### Oracle Installation Binaries
The Oracle Fusion Middleware installation files should be made available on each target host as a network share.  The default location for this is `/u01/app/software`

If a different location is used, you must update the MyST global variable `install.dir`  in the Platform Blueprint.

The operating system user and group for Oracle Fusion Middleware should have read and write access to this share.  
