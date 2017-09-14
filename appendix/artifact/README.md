## {{ page.title }}

<!-- toc -->

#### PCS

Oracle Process Cloud Service (PCS) Applications can be deployed using MyST. For each version of a PCS application which you wish to deploy, you must first register it with MyST. These steps can be performed manually, however, it is recommended to include these steps in a CI server job, so that they can be triggered automatically as required.

**Step 1: Export your application from Process Cloud**

We can export either from the web console or via the REST API.

To use the web console:

1. Navigate to **Develop Processes** within the Process Cloud console
2. Download the Application. This will download a file with the `.exp` file extension.
![](/assets/pcs-export.png)

To use the REST API:

1. Ensure you have `curl` and `jq` installed and are running on Linux based machine
2. Set the following environmental variables to match your environment:
```
PCS_USERNAME="your-email@your-company.com"
PCS_PASSWORD="your-password"
PCS_HOST="your-instance.process.us2.oraclecloud.com"
PCS_PROJECT_ID="Administer%20Patient%20Well%20Being"
PCS_SPACE_NAME="RxR"
PCS_EXPORT_FILE_NAME="AdministerPatientWellBeing.exp"
```
 - Ensure `PCS_SPACE_NAME` matches the design-time space where your Process Application is located. In the example above, it is in the `RxR` space. 
 - And, ensure that any space character in your project name is replaced with the `%20` character.
3. Execute the following to export your project.
```
export PCS_SPACE_ID=$(curl -u ${PCS_USERNAME}:${PCS_PASSWORD} https://${PCS_HOST}/bpm/api/4.0/spaces/ | jq -r ".items[] | select( .name == \"${PCS_SPACE_NAME}\") | .id")
curl -u ${PCS_USERNAME}:${PCS_PASSWORD} https://${PCS_HOST}/bpm/api/4.0/spaces/${PCS_SPACE_ID}/projects/${PCS_PROJECT_ID}/exp > ${PCS_EXPORT_FILE_NAME}
```

At the time of writing, Oracle do not support automated deployment of Decision Model Applications. Therefore, MyST is only able to support deployment of Process Applications at this time.

**Step 2: Create the Maven pom.xml**

1. Create a `pom.xml`. Be sure to set the Maven details to match your environment. An example `pom.xml` is shown below.
```
<?xml version="1.0" encoding="UTF-8"?>
<project
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
  xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.rubiconred</groupId>
  <artifactId>AdministerPatientWellBeing</artifactId>
  <packaging>pom</packaging>
  <version>1.0-1</version>
  <name>Administer Patient Well Being</name>
  <properties>
      <myst.component.type>opaas-pcs</myst.component.type>
      <pcs.deployment-name>Administer Patient Well Being</pcs.deployment-name>
      <pcs.space-name>RxR</pcs.space-name>
      <artifact.repository.type>exp</artifact.repository.type>
  </properties>
</project>
```

MyST supports the following PCS-specific deploy-time properties being defined with the Maven `pom.xml`.

|Property|Description|
|---|---|
|pcs.space-name|Design-time space for the given project. If the application already exists in the design-time space, it will be overwritten.|
|pcs.configuration-plan|Optional: A custom deployment configuration JSON payload in format of the PCS deploy REST API. The file can be a path on the target host or a path in the packaged artifact (e.g. `(EMBEDDED)/pcs.json`). |
|pcs.deployment-name|Optional: Name of the deployed application. If not set, it will default to the Maven `artifactId`|

**Step 3: Publish your application to a Maven Repository**

We can achieve the publish using Maven. For example:

```
mvn deploy:deploy-file -Durl=http://admin:password@your-myst-instance.com/artifactory/libs-release-local \
  -Dfile=AdministerPatientWellBeing.exp \
  -DgroupId=com.rubiconred \
  -DartifactId=AdministerPatientWellBeing \
  -Dversion=1.0-${BUILD_NUMBER} \
  -Dpackaging=jar
```

Be sure to publish to the same Artifact Repository that is defined within the MyST [Continuous Delivery Profile](/infrastructure/continuous-delivery-profile/README.md). This ensures that MyST will be able to retrieve the artifact at deploy-time.

**Step 4: Register the artifact with MyST**

This can be achieved through the MyST Java SDK or via the REST API. Alternatively, if you are using Jenkins, you can use the MyST Jenkins Plugin.

Once the Artifact is registered with MyST it can be added to a new or existing [Application Blueprint](/deploy/application/blueprints/README.md) and promoted across Process Cloud Service instances using a [Release Pipeline](/release/pipeline/README.md).

#### SCA  
|Property|Description|
|---|---|
|composite.configuration-plan|Optional: SOA configuration plan to override endpoint, fault policy location etc. Can be a path on the target host ( [DOMAIN_HOME]/plans/cap.sca.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/cap.sca.configplan.xml)|
|composite.name|SOA composite name for deployment or undeployment|
|composite.partition|SOA partition name to deploy composite into. Also used to undeploy composite|
|composite.redeploy|Boolean flag to control if existing composite can be overriden|
|composite.revision|Deployment version for SOA Composite|
|keepInstancesOnRedeploy|Boolean flag to allow existing running instances to continue on redeployment |
|soa.policies|Reserved for future capability to specify web service policy|
|soa.service-client|Reserved for future capability to specify web service policy |
|soa.service-endpoint|Reserved for future capability to specify web service policy |
|soa.subject|Reserved for future capability to specify web service policy |
|composite.redeploy| Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application. |
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.sca.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.sca.configplan.xml) |

#### OSB
|Property|Description|
|---|---|
| osb.project-name | Optional value for listing the OSB project name(s). This will be used for deleting the artifact. Use comma-separated list (e.g. `a,b,c`) for multiple projects within one Artifact. |
|osb.customization-file|OSB customization file to replace endpoint and other properties|
|myst-config-plan-apply|Optional: Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Optional: MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.osb.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.osb.configplan.xml) |

#### MDS
|Property|Description|
|---|---|
|mds.folder-names|List of folder names from artifact to deploy into MDS. Also used during redeployment.  |
|mds.redeploy| Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application. |
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.mds.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mds.configplan.xml) |

#### ADF
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)|
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.adf.configplan.xml) |
|j2ee.redeploy|Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.|
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.ear becomes Stock.ear)|

#### Java EAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)|
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|j2ee.redeploy|Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) |
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.ear becomes Stock.ear)|

#### Java WAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)|
|j2ee.name| Application name |
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|j2ee.redeploy|Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) 
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.war becomes Stock.war. This means context root will be /Stock instead of /Stock-1.0.0)|

#### SQL
|Property|Description|
|---|---|
|sql.client|Command that can run sql files. e.g. sqlplus|
|sql.data-source-driver|Optional: Assumes Oracle JDBC Driver. Specify if non-Oracle|
|sql.data-source-password|JDBC password, can be a property like ${[rxr.def.Product-rcu].param[db-password]}|
|sql.data-source-sys-role|Optional: Boolean flag to determine if username specified has a sysdba privileges|
|sql.data-source-url|JDBC URL, can be a property like ${[rxr.def.Product-rcu].param[db-url]}|
|sql.data-source-username|JDBC username, can be a property like ${[rxr.def.Product-rcu].param[db-user-prefix]}_SOAINFRA|
|sql.delimiter|Optional: Specify delimiter in sql file to differentiate multiple commands in single file. e.g. ;|
|sql.execute|Path within archive for sql script e.g. (EMBEDDED)/01\_db\_change89778.sql|
|sql.fail-on-error|Optional: Boolean flag to allow script to continue on failure|

#### B2B
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.b2b.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.b2b.configplan.xml) |

#### BAM
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.bam.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.bam.configplan.xml) |

#### MFT
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.mft.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mft.configplan.xml) |

#### Application Configuration (Properties/XML)
|Property|Description|
|---|---|
|expand-properties|Replace files with MyST properties|
|extract-files|Comma separated list of files to extract from archive|
|target-directory|Target directory to place extracted files|
|target-is-domain-directory|Boolean flag to indicate path if path is relative to domain home directory|

#### OSB Custom XPath
|Property|Description|
|---|---|
|extract-files|Comma separated list of files to extract from archive|

#### OWSM Policy
|Property|Description|
|---|---|
|extract-files|Comma separated list of files to extract from archive|

#### JAR Library
|Property|Description|
|---|---|
|target-directory|Target directory to place extracted files|
|target-is-domain-directory|Boolean flag to indicate path if path is relative to domain home directory|

#### Java Shared Library
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application deployments|
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.jar becomes Stock.jar)|



