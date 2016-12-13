Maven is a build automation tool used, initially developed for Java projects, it has become the default build tool for Oracle Middleware.

Maven addressed two aspect of the build process; first it describes how to build the software, and second it describes any build time dependencies. 

The Project Object Model or POM is an XML File that provides all the configuration information required for the build. Such as the software project being built, its dependencies on other external modules and components, the build order, directories, and required plug-ins. 

Most of the work performed A plugin provides a set of goals that can be executed using the following syntax:
 mvn [plugin-name]:[goal-name]

For example, an OSB project can be complied

Maven addresses two aspects of building software: first, it describes how software is built, and second, it describes its dependencies. Contrary to preceding tools like Apache Ant, it uses conventions for the build procedure, and only exceptions need to be written down. An XML file describes 

It comes with pre-defined targets for performing certain well-defined tasks such as compilation of code and its packaging.
Maven dynamically downloads Java libraries and Maven plug-ins from one or more repositories such as the Maven 2 Central Repository, and stores them in a local cache.[4] This local cache of downloaded artifacts can also be updated with artifacts created by local projects. Public repositories can also be updated.


### Create Project Object Model

From JDeveloper, right click on the Stock project and click New then From Gallery.

Type pom into the Search Bar and then select Empty POM (Maven)


Click Ok


Leave the defaults when prompted to enter the location and click Ok.


If prompted to overwrite an existing file, select Yes.

Enter the following details in the pom.xml
* **Group Id:** `com.acme`
* **Artifact Id:** `StockServices`
* **Version:** `1.0-SNAPSHOT`
* **Packaging:** `sbar`
* **Parent > Group Id:** `com.oracle.servicebus`
* **Parent > Artifact Id:** `sbar-project-common`
* **Parent > Version:** `12.2.1-0-0` 

Click on the Source tab. The source should appear as the following:

Do an automated build using Maven
Right-click on the project and click Run Maven then package 

You will see the Maven build running in Apache Maven - package tab.
When the build has completed successfully, the output should look similar to the following.

Navigate to the folder .data/maven on the file system under the project home. You should see a file created called sbconfig.sbar. This file is identical to the jar that we had previously exported.

Commit POM to Version Control
Once we have created our Project Object Model (pom.xml). Let's commit that to our Version Control System so that we can perform automated builds from our CI Server.

