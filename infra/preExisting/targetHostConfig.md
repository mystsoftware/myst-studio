# Target Host Configuration

It is preferential to prepare the target hosts before you begin installation of MyST Studio.
### The steps are as follows:


* Verify the required packages on the target hosts
* Install Java
* Setup the oracle operating system user and group
* Make the Oracle installation binaries available

### Verify the required packages on the target hosts

The following table lists the packages that must be available on the target hosts where you want to install MyST Studio. These are dependencies for Oracle Fusion Middleware and not MyST.

Table 1. Packages required on the target hosts

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

The simplest way to ensure that all of the necessary packages are installed is to use the following commands:

```sh
sudo yum install oracle-rdbms-server-12cR1-preinstall
sudo yum install libstdc++-devel.i686
sudo yum install compat-libstdc++-33 compat-libstdc++-33.i686
```
###Install Java

You must have a version of Java Hotspot installed on each target host.
This is required by the MyST agent runtime.  (This dependency will be removed when full puppet support is included in a future version)

To install Java you can either run the following command

```sh
sudo yum install java
```
or your installation method of choice.

More information can be found on installing Java on Linux at the [here](https://java.com/en/download/help/linux_install.xml).

**Note 1**:  
Oracle Fusion Middleware 12.2.1 requires Java 8  
Oracle Fusion Middleware 12.1.3 and prior requires Java 7  
If you are planning on provisioning both Middleware versions, ensure that both Java versions are installed and that you are referencing the correct Java home in your platform blueprint. This is covered in more detail in the Provisioning Section  

**Note 2**:  
Due to a known issue with the MyST Studio SSH client, you need to create a symbolic link from /usr/bin/java to your actual java binary. For example, if your Java Home is at /usr/java/latest, run the following command on each host:

```sh
ln -s /usr/java/latest/bin/java /usr/bin/java
```

**Note 3**:  
There is a known bug in java that can impact the performance of the Weblogic Scripting Tool (WLST).  To workaround this issue, please do the following:

```sh
cd <java_home>/jre/lib/security
vi  java.security

Comment out
#securerandom.source=file:/dev/urandom

Add the following line
securerandom.source=file:/dev/./urandom 

```
If creating more than 1 target virtual machine than mysttarget1.rubiconred.com, the above settings should be created from a machine image that has the above setup to ensure consistency.


### Setup operating system user and group

Set up an operating system user and group setup on each target host for the Oracle Fusion Middleware ownership. This operating system user requires SSH access with key or password and will be used by the MyST agent. The credentials are encrypted in MyST Studio and should not be shared.

The recommended operating system user and groups to be created are listed in the table below. You can name the users differently, but they must be specified correctly in MyST Studio.  

| Component | Recommended Name |
| -- | -- |
| Operating System User | oracle |
| Operating System Group | oinstall |

To create oracle user and group, do the following:

```sh
sudo /usr/sbin/groupadd oinstall
sudo /usr/sbin/groupadd dba
sudo /usr/sbin/useradd -m -g oinstall -G dba oracle
passwd oracle
```

For ease of use, add sudo permissions to the **oracle** user.

**The operating system user and group must have read and write access to the following directories:**  
* /u01/app/oracle
* /opt/myst
* /tmp/mystWorkspace
 
**Important** - If any of the these directories do not exist, please create them and make sure that the operating system user can read and write to them.

### Oracle Installation Binaries



The Oracle Fusion Middleware installation files should be made available on each target host as a network share.  

The recommended location for this is **/u01/app/software.**  

The operating system user and group for Oracle Fusion Middleware should have read and write access to this share.  

If a different location is used, other than /u01/app/software, you must update the install.dir global variable in the platform blueprint that you create in MyST Studio.