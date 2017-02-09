## {{ page.title }}

The build process is orchestrated by a Continuous Integration (CI) Server, such as Jenkins, TeamCity or Bamboo. During this process, the CI Server will look for any code changes (or commits) since the previous build. This is achieved either through periodically polling or through web hooks from the source code repository (such as Git) to the CI Server.

On discovering a new version of the source code, the CI Sever will check out the latest committed version of the code into a temporary directory and invoke Maven to perform the build. 

The output of the build is packaged up and the artifact is published to a software repository and registered with MyST. It is then ready to be deployed into a staging or production environment as required.

This chapter details how to configure a CI Server to perform an automated build and contains the following sections:
* [Configure Jenkins Build Job](/build/ci/jenkins/README.md)








