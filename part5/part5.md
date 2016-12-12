
Automated builds check out the required code from your source code repository, build and package the code. The packaged code is then place in a Software Repository ready for deployment into the specified environment(s).

Builds are initiated when the developer commits code into a source code repository, such as Subversion or GIT. MyST pulls the code from the source code repository, builds and packages the code ready for release. The build output is placed into a Software Repository, such as Artifactory, Nexus or Archiva. Enabling each release to be deployed to any environment as required.


This part contains the following chapters:

* [Chapter 5.1 - Server Configuration](/part5/5.1.serverConfiguration/5.1.0.buildServerConfiguration.md)
    * [5.1.1 - Configure MyST Continuous Delivery Profile](/part5/5.1.serverConfiguration/5.1.1.configureContinuousDeliveryProfile.md)
    * [5.1.2 - Configure the MyST Studio plugin for Jenkins](/part5/5.1.serverConfiguration/5.1.2.configureJenkinsPlugin.md)


* [Chapter 5.2 - Configure Maven Build](/part5/5.2.configureMavenBuild/5.2.0.configureMavenBuild.md)  

* [Chapter 5.3 - Configue Automated Build ](/part/5.3.configureJenkinsBuild/5.3.0.configureJenkinsBuild.md)

* [Chapter 5.4 - Manage 3rd Party Artifacts](/part4/4.3.configureDataSource/4.3.0.configureDataSource.md)
