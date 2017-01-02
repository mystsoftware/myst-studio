# Build Automation
Application Release Automation starts with building the artifacts that will be deployed into each of our staging environments and eventually production.

The build process is orchestrated by a CI Server, such as Jenkins, TeamCity or Bamboo. During this process, the CI Server will periodically poll the source code repository, such as Subversion or Git for any code changes (or commits) since the previous build. 

On discovering a new version of the source code, the CI Sever will check out the latest committed version of the code into a temporary directory and invoke the necessary steps to build the code.  The build itself is typically performed using [Maven](https://en.wikipedia.org/wiki/Maven), which has become the default build tool for Oracle Middleware.

The output of the build is then packaged up and the artifact published to a software repository, such as Artifactory, Archiva, or Nexus. Ready to be deployed into a staging or production environment as required.

In addition, details of the artifact are registered with MyST, allowing MyST to manage the process of promoting each artifact, as part of an application Blueprint through each staging environment and into production.

This part covers how to automate the build and contains the following chapters:

* [Chapter 5.1 - Server Configuration](5.1.buildServerConfiguration/5.1.0.buildServerConfiguration.md)
    * [5.1.1 - Configure MyST Continuous Delivery Profile](5.1.buildServerConfiguration/5.1.1.configureContinuousDeliveryProfile.md)
    * [5.1.2 - Configure the MyST Studio plugin for Jenkins](5.1.buildServerConfiguration/5.1.2.configureJenkinsPlugin.md)


* [Chapter 5.2 - Configure Maven Builds](5.2.configureMavenBuild/5.2.0.configureMavenBuild.md)  

* [Chapter 5.3 - Configue Automated Builds ](5.3.configureAutomatedBuild/5.3.0.configureAutomatedBuild.md)
    * [Chapter 5.3.1 - Configure Jenkins Build Jobs](5.3.configureJenkinsBuild/5.3.1.configureJenkinsBuild.md)


* [Chapter 5.4 - Artifact Management](5.4.artifactManagement/5.4.0.artifactManagement.md)
