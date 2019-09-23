# {{ page.title }}

<!-- toc -->

## Prerequisites

The following prerequisites should be in place on the server that will host MyST Studio prior to running the MyST installer.

 * Java 1.7+ is installed.
 * Docker 1.10+ and Docker Compose is installed.
 * The MyST license tar.gz file must be available. This is provided when you sign up to try MyST Studio.

After the installation, internet access is required for the latest version of MyST to be pulled down directly from the public MyST Docker Registry. If you are behind an internet proxy, please follow [these steps](https://rubiconred.gitbooks.io/myst-help-center/content/how-do-i-setup-myst-and-associated-components-to-use-an-internet-proxy.html) to ensure all installation dependencies can be directly pulled from the Rubicon Red Docker Registry.

{% hint style='info' %}
If you are unable to use Docker, there are details on non-Docker installation [here](alternatives/README.md)
{% endhint %}

## Network Requirements

As MyST is a management tool, it is best suited in a management network so that it can access all of the environments that it needs to manage. The below table provides a set of recommended firewall rules for the MyST Studio server itself in a case where the MyST Build Server and MyST Artifact Repository are all residing on the same host.

| Source | Destination | Protocol | Note |
| ------ | ----------- | -------- | ---- |
| Any | `myst-studio:443` | HTTPS | Access to MyST Studio Console |
| Any | `myst-studio:8081` | HTTP | Access to MyST Build Server |
| Any | `myst-studio:8083` | HTTP | Access to MyST Artifact Repository |
| `myst-studio` | OFMW Admin Server Host(s) | SSH | MyST Studio will connect over ssh to the Admin Server of each environment for management operations. |
| OFMW Admin Server Host(s) | OFMW Managed Server Hosts | SSH | MyST Agent will ssh from admin to managed server hosts if needed for installation and patching. |
| OFMW Admin Server Host(s) | `myst-studio:8083` | HTTP | MyST Agent will retrieve built artifacts for deployment from the MyST Artifact Repository |

Optionally, the MyST Build Server and MyST Artifact Repository can be frontend by a HTTP Server similar to MyST Studio allowing for HTTPS traffic only. If you are not using the MyST Build Server and Artifact Repository and instead integrating with a different Build (CI) Server or Maven-based Artifact Repository, similar firewalling rules should be in place although the ports may be different.

## Installation using the Wizard

The installation wizard can be kicked off by executing the jar installer using Java as follows:

```
java -jar <installer file>
```

If you need to run MyST Studio installer from the console (non-graphical), you can execute the following:

```
java -jar <installer file> -console
```

In the first step, you will be provided with an overview of the prerequisites.

![](/assets/Screenshot 2017-04-04 08.52.06.png)

In the next step, you will be asked to enter a path for the MyST Studio utilities. The standard convention is to installer under `/opt/myst-studio` however any path can be used.

![](/assets/Screenshot 2017-04-04 08.52.34.png)

In the next step, we can choose which packs we wish to install. At a minimum **MyST Studio** will be selected.

![](/assets/Screenshot 2017-04-04 08.53.08.png)

Optionally, you can choose:

 * **MyST Build Server**: Pre-configured Build Server for use with MyST for if you don't already have one.
 * **MyST Artifact Repository**: Pre-configured Maven Artifact Repository for if you don't already have one.
 * **Build Extension for Oracle Middleware**: Enables automated build for applications build on SOA, BPM, OSB, ADF and other products related to Oracle Middleware. When you choose this, it will automatically select **MyST Build Server** if it is not already selected. The Build Extensions are currently supported for:
  * 12.2.1.3.0
  * 12.2.1.2.0
  * 12.2.1.1.0

Click Next.

In the next step, you will be prompted to import the MyST license key. The file is provided when you sign up for MyST and is in a format similar to `MyST-*.lic.tar.gz`

![](/assets/Screenshot 2017-04-04 08.53.19.png)

{% hint style='tip ' %}
Prior to April 2017, MyST users were provided with a separate `api.key` and `MyST.lic` file. In installers prior to 5.5.0.0, these had to be imported separately. If you do not have a `tar.gz` file but have `api.key` and `MyST.lic` you can compress them to a new `tar.gz` and use that for that installer.
{% endhint %}

You will be prompted to confirm installation. Click Next.

![](/assets/Screenshot 2017-04-04 08.53.41.png)

The installation should take only a second or two.

![](/assets/Screenshot 2017-04-04 08.53.51.png)

After the installation is successful, you will be prompted with the next steps to be performed.

![](/assets/Screenshot 2017-04-04 08.53.55.png)

If desired, you can generate a silent installation script which can be used to perform an installation silently.

![](/assets/Screenshot 2017-04-04 08.53.58.png)

{% hint style='tip' %}
Silent Installation
{% endhint %}
> To run a silent installation you can execute the following:
```
java -jar <installer file> <response file>
```

## Providing Certificates for SSL

By default, MyST Studio will boot up with demo SSL certificates, this may be ok for a development or sandbox environment but should  not be used for production.

{% hint style='danger' %}
If you do not replace the demo certificates, you will get security warnings from your browser when you access the MyST Studio console.
{% endhint %}

To update the certificates, replace the demo certificates at the following locations with your real certificates:
 * conf/data/nginx/ssl/cert.crt
 * conf/data/nginx/ssl/cert.key

{% hint style='danger' %}
Warning
{% endhint %}
> If you have already started the MyST Studio stack, you must force a rebuild of the data container when you restart the stack, this can be done with the following command.
`./bin/start.sh -u`
If you are yet to start the stack, please continue on to the next steps. MyST will automatically build the data container on the first start.

## Configuring Build Extensions

If you choose the **Build Extensions for Oracle Middleware** then you will need to download Oracle installers and a JDK. Place them in the MyST home at the following locations depending on the versions you chose:

{% hint style='info' %}
Build Extensions in docker data containers are deprecated. MyST 5.8.6 uses docker volume mounts.

Docker volume mounts allow Oracle installers to be installed on the filesystem then volume mounted to the MyST Build Server docker container.
{% endhint %}

| Version | File |
| --- | -- |
| 12.2.1.1.0 | conf/fmw/context/jdk/jdk-8u121-linux-x64.tar.gz<br> conf/fmw/context/12211/installers/fmw_12.2.1.1.0_infrastructure.jar<br> conf/fmw/context/12211/installers/fmw_12.2.1.1.0_osb.jar<br> conf/fmw/context/12211/installers/fmw_12.2.1.1.0_soa.jar |
| 12.2.1.2.0 | conf/fmw/context/jdk/jdk-8u121-linux-x64.tar.gz<br> conf/fmw/context/12212/installers/fmw_12.2.1.2.0_infrastructure.jar<br> conf/fmw/context/12212/installers/fmw_12.2.1.2.0_osb.jar<br> conf/fmw/context/12212/installers/fmw_12.2.1.2.0_soa.jar |
| 12.2.1.3.0 | conf/fmw/context/jdk/jdk-8u131-linux-x64.tar.gz<br> conf/fmw/context/12213/installers/fmw_12.2.1.3.0_infrastructure.jar<br> conf/fmw/context/12213/installers/fmw_12.2.1.3.0_osb.jar<br> conf/fmw/context/12213/installers/fmw_12.2.1.3.0_soa.jar |

Once the Oracle installers are placed in the desired locations, you will need to install FMW by executing the following:

```
cd /opt/myst-studio/fmw
./install-fmw.sh
```

{% hint style='info' %}
For version 12.2.1.3.0 the `install-fmw.sh` script will also fix Oracle Maven Plugin dependency errors.
{% endhint %}

## Starting the MyST Studio Stack

After the successful installation navigate to the MyST Studio home (in our example, `/opt/myst-studio`) and execute the following:
```
cd /opt/myst-studio/bin
./start.sh
```

Once the `start.sh` has completed you should be able to access the MyST Studio console at `https://<your host>/console`.

You can see the details of your running instances by executing `docker ps` from the command line.

## Configuring Maven for Automated Build of Oracle Middleware

If you choose **Build Extensions for Oracle Middleware** when installing MyST, Maven must be configured on the build server, before you can build applications to run on products such as SOA, BPM, OSB and ADF. This can be done by simply executing the following from the MyST Studio home where SHORT_VERSION could be 122130 if you installed OFMW 12.2.1.3.0.
```
cd /opt/myst-studio/bin
./configure-maven.sh <SHORT_VERSION>
```
{% hint style='info' %}
If you skipped the post-installation steps documented in the section on **Configuring the Build Extensions** the above command will not succeed.
{% endhint %}

## Offline Installation

It is highly recommended that proxied internet access be available for the MyST server. This allows for easy upgrade of MyST by simply specifying a version number to download (e.g. `./upgrade.sh 5.5.0.0`). In an event that MyST Studio does not have internet access, you will need to download the required MyST Studio Docker Images from a host with internet access and then copy them to the MyST Server before executing the `start.sh` or `upgrade.sh`. Depending on whether you choose "MyST Build Server" and "MyST Artifact Repository", there may be multiple Docker images that need to be downloaded and copied to the server.

### MyST Studio (Offline)

The MyST Studio Docker Image can be downloaded from the MyST website.

![](install.png)

After downloading the MyST Studio installer from the website, copy it to the MyST host and execute the following

```
gunzip myst-studio-docker-image-5.5.0.0.tar.gz
sudo docker load -i myst-studio-docker-image-5.5.0.0.tar
docker tag  docker-registry.rubiconred.aws:5000/myst-studio:5.5.0.0 myst-studio
```
Make sure that you replace the above version details to correspond to that version of MyST that was downloaded.

### MyST Build Server (Offline)

If you are planning to use MyST Build Server on a host without internet access, from a host with internet access and Docker installed run the following:
```
docker pull jenkins
docker save jenkins > myst-build-base.tar
```
Then copy the `myst-build-base.tar` to the MyST host and execute the following:
```
docker load -i myst-build-base.tar
```

### MyST Artifact Repository (Offline)

If you are planning to use MyST Artifact Repository on a host without internet access, from a host with internet access and Docker + MyST installed run the following:
```
/opt/myst-studio/bin/pull.sh
docker save maven-repository > maven-repository.tar
```
Then copy the `maven-repository.tar` to the MyST host and execute the following:
```
docker load -i maven-repository.tar
```

### Build Extensions for Oracle Middleware (Offline)

If you are planning to use MyST Artifact Repository on a host without internet access, from a host with internet access and Docker + MyST installed run the following:
```
docker pull oraclelinux:7
docker save oraclelinux:7 > oracle-linux.tar
```
Then copy the `oracle-linux.tar` to the MyST host and execute the following:
```
docker load -i oracle-linux.tar
```
