## {{ page.title }}

Maven is a build automation tool initially developed for Java projects. It has become the default build tool for Oracle Middleware.

Maven addresses two aspects of the build process; first, it describes how to build the software, and second, it describes any build time dependencies.

The Project Object Model or POM is an XML File that provides all the configuration information required by Maven for the build, such as the software project being built, its dependencies on other external modules and components, the build order, directories, and required plug-ins. 

For each artifact that we wish to build, we need to create a corresponding POM file. Once created, we need to commit that to our Version Control System so that we can perform automated builds from our CI Server.

### Populating Binary Repository with Maven plugin

The Oracle Maven Synchronization plugin supports populating local and remote repositories with artifacts from a given Oracle Middleware installation. Follow instructions in Oracle documentation to setup your Binary repository. 

Sample commands are shown below. Update the values of **ORACLE_HOME**, and **ARTIFACTORY_SERVER** to suit the target environment. Note: This command can take anywhere between 2 and 4 hours to complete.

```
export ORACLE_HOME=/opt/app/oracle/product/fmw1221

mvn deploy:deploy-file -Dfile=${ORACLE_HOME}/oracle_common/plugins/maven/com/oracle/maven/oracle-maven-sync/12.2.1/oracle-maven-sync-12.2.1.jar -DpomFile=${ORACLE_HOME}/oracle_common/plugins/maven/com/oracle/maven/oracle-maven-sync/12.2.1/oracle-maven-sync-12.2.1.pom -Durl=http://<ARTFIACTORY_SERVER>:8081/artifactory/ext-release-local/ -DrepositoryId=artifactory

mvn com.oracle.maven:oracle-maven-sync:push -DoracleHome=${ORACLE_HOME} -DtestingOnly=false -DserverId=artifactory

```

Corresponding maven settings file
```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
  <servers>	
    <server>  
      <username>admin</username>  
      <password>password</password>  
      <id>artifactory</id>  
    </server>  
  </servers>
  <profiles>
	<profile>
	  <id>oracle-repo</id>
	  <repositories>		
		<repository>
		  <id>artifactory</id>
		  <name>artifactory</name>
		  <url>http://localhost:8081/artifactory/ext-release-local</url>
		  <layout>default</layout>
          <snapshots>
             <enabled>false</enabled>
          </snapshots>
          <releases>
            <updatePolicy>never</updatePolicy>
          </releases>
		</repository>
	  </repositories>
	</profile>
  </profiles>
  <activeProfiles>
    <activeProfile>oracle-repo</activeProfile>
  </activeProfiles>

</settings>

```

### Building Oracle Service Bus Projects with Maven

In this section, we provide a detailed walkthrough on how to create a POM file in JDeveloper. In this example, we will show how to create a POM file for an OSB project. A similar approach would also be used for other artifact types.

Within JDeveloper, locate the OSB project that we wish to build with Maven. Right click on the project and click `New` and then select `From Gallery`.

![](img/jdevCreatePom.png)

Type `pom` into the Search Bar and then select `Empty POM (Maven)`.

![](img/emptyPom.png)

Click `OK`. JDeveloper will open the `Create a Maven POM` dialogue. Leave the defaults when prompted to enter the location and click `Ok`.

![](img/createPomForm.png)

If prompted to overwrite an existing file, select `Yes`.

![](img/overwritePom.png)

JDeveloper will then prompt us to enter the following values:
* **Group Id:** The groupId for your new project. This usually starts with your organization's domain name in reverse format. For example `com.acme`.
* **Artifact Id:** The artifactId for your OSB project. This is usually an identifier for this project.
* **Version:** The version for our OSB project. This is usually 1.0-SNAPSHOT for a new project.
* **Packaging** - This must be set to `sbar`
* **Parent > Group Id** - This must be set to `com.oracle.servicebus`.
* **Parent > Artifact Id** - This must be set to `sbar-project-common`.
* **Parent > Version** - This must be set to the version of the Oracle Service Bus, for example, 12.1.3-0-0 or 12.2.1-0-0.

![](img/createPom.png)

Click on the Source tab. The source should look similar to the following:
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.acme</groupId>
    <artifactId>StockServices</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>sbar</packaging>
    <parent>
        <groupId>com.oracle.servicebus</groupId>
        <artifactId>sbar-project-common</artifactId>
        <version>12.2.1-0-0</version>
    </parent>
</project>
```

Once completed, save the POM.

> When creating a POM for a different artifact type, we will need to specify the appropriate **packaging** and parent **groupId**, **artifactId** and **version**. For further details, refer to the Oracle [Documentation](https://docs.oracle.com/middleware/1221/core/MAVEN/toc.htm).

#### Test Maven Build
Prior to configuring our CI Server to automatically executing our Maven build, it is good practice to test that we have correctly configured our POM file by executing the Maven build from within JDeveloper.

Right-click on the project and click `Run Maven` then `package`.

![](img/mvnPackage.png)

We should see the Maven build running in the `Apache Maven - package` tab. Once the build has completed successfully, the output should look similar to the following.

![](img/mvnPackageOutput.png)

Navigate to the folder .data/maven on the file system under the project home. You should see a file created called `sbconfig.sbar`.

> Once we have created our Project Object Model (pom.xml). We **must** commit it to our Version Control System so that we can perform automated builds from our CI Server.

