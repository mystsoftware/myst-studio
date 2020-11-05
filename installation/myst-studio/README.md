# {{ page.title }}

<!-- toc -->

## Understanding the Myst installation

A typical Myst installation consists of the following:

| Component | Purpose |
| --------- | ----------- |
| Myst Studio | Web-based Management Console |
| Myst Repository | Storage layer for Myst platform and application state |
| Myst Build Server | Optional CI Server, if not using a third-party one such as Jenkins |
| Myst Maven Repository | Optional Maven Repository, if not using a third-party one such as Artifactory |

The Myst Studio console can be installed on a single server or across multiple tiers. Myst is supported on a container-based architecture (e.g. `docker`) or on a virtual/physical server architecture. Rubicon Red recommend the use of the container-based architecture.

## Myst Topology

The Myst Server can be established on modern container runtimes such as `docker` (CE / EE) and `containerd`. An installer is provided to easily establish the stack on a single server instance. After completing the installation and starting the containers, the following containers will be running:

- `myststudio_https` - Nginx exposing `443` and `80`
- `myststudio_web` - Tomcat instance accessed by `myststudio_https`
- `myststudio_db` - MySQL instance accessed by `myststudio_web`

State for the stack is automatically stored in a container volume and accessed via `myststudio_db`.

The following additional containers can be optionally installed:
- `myststudio_ci` - Myst Build Server exposing `8081` by default
- `maven-repository` - Myst Maven Repository exposing `8083` by default

Exposed ports can be configured by adjusting the port mappings in the `docker-compose` / `docker stack` configuration

## Alternative Myst Topologies

In an event that container-based topology is undesired, the stack can be rolled out on a non-container infrastructure. More details on this approach are documented in the [Alternative Installations](alternatives/README.md) section.

## System Requirements

The following prerequisites should be in place on the server that will host Myst Studio prior to running the Myst installer.

 * Java 1.7+ is installed.
 * Docker 1.10+ and Docker Compose is installed.
 * The Myst license tar.gz file must be available. This is provided when you sign up for Myst Studio.

 After the installation, internet access is required for the latest version of Myst to be pulled down directly from the public Myst Docker Registry. If you are behind an internet proxy, please follow [these steps](https://rubiconred.gitbooks.io/myst-help-center/content/how-do-i-setup-myst-and-associated-components-to-use-an-internet-proxy.html) to ensure all installation dependencies can be directly pulled from the Rubicon Red Docker Registry.

 {% hint style='info' %}
 If you are unable to use Docker, there are details on non-Docker installation [here](alternatives/README.md)
 {% endhint %}

## Network Requirements

As Myst is a management tool, it is best suited in a management network so that it can access all of the environments that it needs to manage. Myst will connect to the instances that it manages via `ssh` protocol and `tcp` as needed. More details on network requirements are available [here](docker/README.md#network-requirements) section.

## Installation in 3 simple steps

Once the Myst installer has been download, it can be used to establish the Myst stack on `docker`. Once the [System Requirements](#system-requirements) are in place, the process of getting up and running is a 3 steps process.

1. Run the Myst Installer
```
java -jar fc-installer-6.3.1.jar
```
2. After running the installer, Myst can be started with
```
/opt/myst-studio/bin/start.sh
```
3. By default, the Myst Studio console is accessible from  `https://localhost/console`.

Detailed installation instructions are available within the [Docker-based Installation Guide](docker/README.md). For non-Docker installation, please consult the [Alternative Installations Guide](alternatives/README.md)
