# {{ page.title }}

Prior to automating the build we need to configure MyST to connect to the other components involved in build and deployment process, specifically:
* **Version Control System** - This contains information about the source code management system used for managing for artifact source code.
* **Continuous Integration Server** - This is the CI Server, for example Jenkins, TeamCity, Bamboo, that is used to build the artifacts from the source code.
* **Binary Repository** - This is the Software Repository, for example Artifactory, Nexus or Archiva, that is used to store the binaries produced by the build.

In addition, as part of the build process, we require the CI Server to publish details of each artifact build to MyST Studio. To enable this we need to install and configure the MyST Studio plugin.

This chapter contains the following sections:
* [Configure MyST Continuous Delivery Profile](/infrastructure/continuous-delivery-profile/README.md)
* [Configure the MyST Studio plugin for Jenkins](/build/server/configuration/jenkins/README.md)




























