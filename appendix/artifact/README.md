## {{ page.title }}

<!-- toc -->

#### PCS

Process Cloud Service

{% include "test.md" %}

...

{% include book.file1 %}

...

{% include book.myst_repo+"/myst/fc-parent/fc-sdk/fc-studio-sdk-payload/src/test/resources/src/artifacts/sca/pom.xml" %}



`myst.component.type=opaas-pcs`

|Property|Description|
|---|---|
|pcs.configuration-plan|Optional: A custom deployment configuration JSON payload in format of the PCS deploy REST API. The file can be a path on the target host or a path in the packaged artifact (e.g. `(EMBEDDED)/pcs.json`). |
|pcs.space-name|Design-time space for the given project|

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



