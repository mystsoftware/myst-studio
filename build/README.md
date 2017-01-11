# {{ page.title }}

Application Release Automation starts with building the artifacts that will be deployed into each of our staging environments and eventually production.

The build process is orchestrated by a Continuous Integration (CI) Server, such as Jenkins, TeamCity or Bamboo. During this process, the CI Server will periodically poll the source code repository, such as Subversion or Git, for any code changes (or commits) since the previous build. 

On discovering a new version of the source code, the CI Sever will check out the latest committed version of the code into a temporary directory and invoke the necessary steps to build the code.  The build itself is typically performed using [Maven](https://en.wikipedia.org/wiki/Maven), which has become the default build tool for Oracle Middleware.

The output of the build is then packaged up and the artifact published to a software repository, such as Artifactory, Archiva, or Nexus. The artifact is now ready to be deployed into a staging or production environment as required.

In addition, details of the artifact are registered with MyST, allowing MyST to manage the process of promoting each artifact as part of an Application Blueprint through each staging environment and into production.

This part covers build automation and contains the following chapters:

* [Chapter 5.1 - Server Configuration](/build/server/configuration/README.md)
    * [5.1.1 - Configure MyST Continuous Delivery Profile](/infrastructure/continuous-delivery-profile/README.md)
    * [5.1.2 - Configure the MyST Studio plugin for Jenkins](/build/server/configuration/jenkins/README.md)


* [Chapter 5.2 - Configure Maven Builds](/build/maven/README.md)  

* [Chapter 5.3 - Configure Automated Builds ](/build/ci/README.md)
    * [Chapter 5.3.1 - Configure Jenkins Build Jobs](/build/ci/jenkins/README.md)


* [Chapter 5.4 - Artifact Management](/build/artifacts/README.md)
