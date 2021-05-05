## {{ page.title }}

<!-- toc -->

#### Default Workspace

By default Myst will publish artifacts to the default Myst workspace named `Default` with an ID of `6fafeb5a-0bcb-4683-8f57-e287ea7eebaf`. To change the default [workspace](/administration/workspaces/README.md) add the following:

```xml
<properties>
  <myst-workspace>Mr_Rob</myst-workspace>

  <!-- Multiple Workspaces
  <myst-workspace>Default,Mr_Rob</myst-workspace>
  -->

</properties>
```

#### Property Exclusions

A list of artifact properties excluded from being published to Myst Studio. Avoid using the following properties:

- `core.*`
- `internal*`

#### ICS (Integration Cloud Service)

See [Integration Cloud Service](OracleCloud.md) for more information.

| Property               | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| ics.configuration-plan | Optional: Used for defining configuration for the integration connections. The file can be a path on the target host or a path in the packaged artifact (e.g. `(EMBEDDED)/ics.json`). |
| ics.deployment-name    | Optional: Name of the deployed application. If not set, it will default to the Maven `artifactId` |

#### PCS (Process Cloud Service)

See [Process Cloud Service](OracleCloud.md) for more information.

| Property               | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| pcs.space-name         | Design-time space for the given project. If the application already exists in the design-time space, it will be overwritten. |
| pcs.configuration-plan | Optional: A custom deployment configuration JSON payload in the format of the REST API call for deploying Process Applications. The file can be a path on the target host or a path in the packaged artifact (e.g. `(EMBEDDED)/pcs.json`). |
| pcs.deployment-name    | Optional: Name of the deployed application. If not set, it will default to the Maven `artifactId` |

#### SCA
|Property|Description|
|---|---|
|configuration-plan|Optional: SOA configuration plan to override endpoint, fault policy location etc. Can be a path on the target host ( [DOMAIN_HOME]/plans/cap.sca.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/cap.sca.configplan.xml)|
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
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.sca.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.sca.configplan.xml) |
|forceDefault|Optional: (true/false) Boolean flag to set whether the composite is default. Defaults to true.|

#### OSB

Preserving security and operational values defaults to **false** (ie. Myst will deploy and overwrite). For more information see [Oracle Documentation](https://docs.oracle.com/en/middleware/soa-suite/service-bus/12.2.1.4/develop/importing-and-exporting-resources-and-configurations.html#GUID-5BED0170-B694-4488-B209-4964FAFD0AF0). To globally override `preserve-xxxxx` go to **Product > Oracle Service Bus** and add parameters as needed:

```properties
preserve-security-and-policy-values=true
preserve-credentials=true
preserve-access-control-policies=true
preserve-environment-variable-values=true
preserve-operational-values=true
```



|Property|Description|
|---|---|
| osb.project-name | Optional value for listing the OSB project name(s). This will be used for deleting the artifact. Use comma-separated list (e.g. `a,b,c`) for multiple projects within one Artifact. |
|osb.customization-file|OSB customization file to replace endpoint and other properties|
|myst-config-plan-apply|Optional: Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Optional: Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.osb.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.osb.configplan.xml) |
|preserve-security-and-policy-values|Optional: (true/false) Preserve security and policy values. Defaults to true. |
|preserve-credentials|Optional: (true/false) Preserve credentials. Defaults to true. |
|preserve-access-control-policies|Optional: (true/false) Preserve access control policies. Defaults to true. |
|preserve-environment-variable-values|Optional: (true/false) Preserve environment variable values. Defaults to true. |
|preserve-operational-values|Optional: (true/false) Preserve operational values. Defaults to true. |
#### MDS
|Property|Description|
|---|---|
|mds.folder-names|List of folder names from artifact to deploy into MDS. Also used during redeployment.  |
|mds.redeploy| Whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application. |
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.mds.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mds.configplan.xml) |

#### ADF
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment.order`|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment-plan`|
|j2ee.redeploy|Boolean flag to control whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `redeploy`|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `stage-mode`|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `target`|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.adf.configplan.xml) |
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.ear becomes Stock.ear)|

#### Java EAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment.order`|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment-plan`|
|j2ee.redeploy|Boolean flag to control whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `redeploy`|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `stage-mode`|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `target`|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) |
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.ear becomes Stock.ear)|

#### Java WAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment.order`|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `deployment-plan`|
|j2ee.name| Application name |
|j2ee.redeploy|Boolean flag to control whether or not to do an undeploy before a deployment. You do not need to set this for a typical 'redeploy'. It should be reserved for exceptional circumstances where a component can't be deployed until an undeploy usually due to poor code or a bug in the application.<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `redeploy`|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `stage-mode`|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster<br /><br />For Myst CLI or Platform Blueprint > System Artifacts use property: `target`|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml)
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
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.b2b.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.b2b.configplan.xml) |

#### BAM
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.bam.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.bam.configplan.xml) |

#### MFT
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.mft.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mft.configplan.xml) |

#### Application Configuration (Properties/XML)
|Property|Description|
|---|---|
|expand-properties|Optional: (true/false) defaults to true. Used with extract-files property. <br><br>Takes files from the extract-files property with Maven/Ant-style references (eg. ${my.property} and substitutes them with name/value pairs from the Myst Platform Model properties. <br><br> For Myst CLI or Platform Blueprint > System Artifacts use property: `customize`|
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
|strip-version|Optional: Boolean flag to strip version from the artifact prior to deploy (e.g. Stock-1.0.0.jar becomes Stock.jar)|

#### ODI Application (XML)
|Property|Description|
|---|---|
|extract-files|Comma separated list of files to extract from archive and will be deployed via Smart Import|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Myst configuration plan location to search and replace files with Myst properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.mft.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mft.configplan.xml) |
| export-key                 | (Optional) Export key password |
| import-without-cipher-data | (Optional) Boolean. If set to `true` the export-key parameter is ignored |

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

#### Flyway Archive
See [Flyway Documentation](https://flywaydb.org/documentation) for more information.

|Property|Description|
|---|---|
| flyway.home      | Flyway installation home directory location |
| flyway.username  | JDBC username `${[rxr.def.Product-rcu].param[db-user-prefix]}_SOAINFRA` |
| flyway.password  | JDBC password `${[rxr.def.Product-rcu].param[db-password]}` |
| flyway.locations | Comma separated list of SQL folders `filesystem:sql/<sqlfolder_name1>,filesystem:sql/<sqlfolder_name2>/<sqlfolder_name3>` |
| flyway.edition   | (Optional) Flyway edition `teams` |
| flyway.url       | JDBC URL `${[rxr.def.Product-rcu].param[db-url]}` |
| flyway.schemas   | JDBC schema `${[rxr.def.Product-rcu].param[db-user-prefix]}_SOAINFRA` |
| flyway.conf      | (Optional) Flyway configuration file location. If unspecified then Flyway will use `flyway.home/flyway.conf` |

