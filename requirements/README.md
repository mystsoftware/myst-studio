# {{ page.title }}

Following are the minimum server requirements for installing the MyST server and its associated recommended components either on premise or on cloud.

Please note: It is recommended **NOT** to install MyST onto an Exalogic VServer as some versions of Exalogic VM templates do not support the Linux kernel version required for stable Docker support. A Physical or Virtual Machine x86 install of MyST is recommended.

# Option 1: All-in-one

**Note**: The following specifications will adequately provide a starting platform in regards to disk usage. Disk usage for Jenkins and Artifactory may need to be reviewed depending on frequency, size and retention policy of builds and associated binary artefacts.

| Component | Requirement |
| --------- | ----------- |
| Container | VM / Bare Metal<br>Located within a network zone that can connect to all environments |
| O/S | Red Hat Enterprise Linux 7.x with Kernel 3.10 and higher<br>Oracle Linux 6.7+ or 7.x with Kernel 4.1.12 and higher |
| vCPU | 4 |
| Memory | 16 GB |
| Storage | /root (base)                 **20GB**<br>/var/lib/docker            **60GB**<br>/opt/myst-studio        **20GB** |
| Installed Software | Java 1.8.0\_77+<br>docker-engine (latest; 1.10+ minimum)<br>docker-compose (latest; 1.10+ minimum) (see https://docs.docker.com/compose/install/) |
| Groups | docker<br>myst |
| Users | myst:myst,docker <br> **Note:** The myst user should have a uid of 1000 in order for Jenkins to read the FMW installation |

**Jenkins Networking access**

The following are required for Jenkins.

| Source | Destination | Protocol | Notes |
| --- | --- | --- | --- |
| Jenkins:ANY | MYST:443 | HTTPS | Access to MyST Studio |
| Jenkins:ANY | Artifactory | HTTP | Access to Artifactory (co-located) |
| Jenkins:ANY | updates.jenkins.io | HTTPS | Access to Jenkins update site for plugins |

**Note:** MYST = MyST Utility Server, Jenkins = Jenkins CI Server (which runs as MYST:8081 when co-located), Artifactory = Artifact binary repository (which runs as MYST:8083 when co-located)

**Artifactory Networking access**

The following are required for Artifactory.

| Source | Destination | Protocol | Notes |
| --- | --- | --- | --- |
| Jenkins:ANY | Artifactory | HTTP(S) | Access to Artifactory (for upload) |
| OFM\_AS:ANY | Artifactory | HTTP(S) | Access to Artifactory (for download) |
| Artifactory:ANY | repo1.maven.org | HTTP | Access to public Maven repositories |

**Note** : MYST = MyST Utility Server, OFM\_AS = Any OFM target AdminServer host upon which MyST will provision and deploy, Jenkins = Jenkins CI Server (which runs as MYST:8081 when co-located), Artifactory = Artifact binary repository (which runs as MYST:8083 when co-located)

# Option 2: Separated

### MyST Server Specification

| Component | Requirement |
| --- | --- |
| Container | VM / Bare Metal<br>The location within a network zone that can connect to all environments |
| O/S | Red Hat Enterprise Linux 7.x with Kernel 3.10 and higher<br>Oracle Linux 6.7+ or 7.x with Kernel 4.1.12 and higher |
| Installed Software | Java 1.8.0\_77+<br>docker-engine (latest; 1.10+ minimum)<br>docker-compose (latest; 1.10+ minimum) (see https://docs.docker.com/compose/install/) |
| vCPU | 2 |
| Memory | 8 GB |
| Storage | /root (base)                 **20GB**<br>/var/lib/docker            **20GB**<br>/opt/myst-studio        **10GB** |
| Groups | docker<br>myst |
| Users | myst:myst,docker |

### Continuous Integration Server Specification (Jenkins)

| Component | Requirement |
| --- | --- |
| Container | VM / Bare Metal<br>The location within a network zone that can connect to all environments |
| O/S | Red Hat Enterprise Linux 7.x with Kernel 3.10 and higher<br>Oracle Linux 6.7+ or 7.x with Kernel 4.1.12 and higher |
| Installed Software | docker-engine (latest)<br>docker-compose (latest) (see https://docs.docker.com/compose/install/) |
| vCPU | 2 |
| Memory | 8 GB |
| Storage | /root (base)                 **20GB**<br>/var/lib/docker            **20GB**<br>/u01/app/oracle         **20GB** |
| Groups | docker<br>myst |
| Users | myst:myst,docker |
||**Note:** The myst user should have a uid of 1000 in order for Jenkins to read the FMW installation|

### Binary Repository Server Specification (Artifactory)

| Component | Requirement |
| --- | --- |
| Container | VM / Bare Metal<br>The location within a network zone that can connect to all environments |
| O/S | Red Hat Enterprise Linux 7.x with Kernel 3.10 and higher<br>Oracle Linux 6.7+ or 7.x with Kernel 4.1.12 and higher |
| Installed Software | docker-engine (latest)<br>docker-compose (latest) (see https://docs.docker.com/compose/install/) |
| vCPU | 2 |
| Memory | 4 GB |
| Storage | /root (base)                  **20GB**<br>/var/lib/docker            **20GB** |
| Groups | docker<br>myst |
| Users | myst:myst,docker |
