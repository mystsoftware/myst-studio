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

