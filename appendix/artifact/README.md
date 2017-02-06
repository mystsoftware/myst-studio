## {{ page.title }}

<!-- toc -->

#### SCA  
|Property|Description|
|---|---|
|composite.configuration-plan|Optional: SOA configuration plan to override endpoint, fault policy location etc. Can be a path on the target host ( [DOMAIN_HOME]/plans/cap.sca.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/cap.sca.configplan.xml)|
|composite.name|SOA composite name for deployment or undeployment|
|composite.partition|SOA partition name to deploy composite into. Also used to undeploy composite|
|composite.redeploy|Boolean flag to control if existing composite can be overriden|
|composite.revision|Deployment version for SOA Composite|
|keepInstancesOnRedeploy|Boolean flag to allow existing running instances to continue on redeployment |
|soa.policies|TODO: web service policy?|
|soa.service-client|TODO: |
|soa.service-endpoint|TODO: |
|soa.subject|TODO: |

#### OSB
|Property|Description|
|---|---|
|customization-file|OSB customization file to replace endpoint and other properties|
|myst-config-plan-apply|Optional: Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|Optional: MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.osb.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.osb.configplan.xml) |

#### MDS
|Property|Description|
|---|---|
|mds.folder-names|Optional: Specify folders within archive to update MDS with |
|mds.redeploy|Boolean flag to control whether MDS can be overwritten. |

#### ADF
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.adf.configplan.xml) |


#### Java EAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)|
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) |
|strip-version|||

#### Java WAR
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.deployment-plan|Optional: Weblogic Application Deployment Plan to configure deployment descriptors and override property values. Can be a path on the target host ([DOMAIN_HOME]/plans/myst.adf.configplan.xml)|
|j2ee.name| Application name |
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) 
|strip-version||

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
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.b2b.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.b2b.configplan.xml) |



#### BAM
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.bam.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.bam.configplan.xml) |

#### MFT
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.mft.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.mft.configplan.xml) |

#### Application Configuration (Properties/XML)
|Property|Description|
|---|---|
|expand-properties|TODO:|
|extract-files|TODO:|
|target-directory|TODO:|
|target-is-domain-directory|TODO:|

#### OSB Custom XPath
|Property|Description|
|---|---|
|extract-files|TODO:|

#### OWSM Policy
|Property|Description|
|---|---|
|extract-files|TODO:|

#### JAR Library
|Property|Description|
|---|---|
|target-directory|TODO:|
|target-is-domain-directory|TODO:|

#### Java Shared Library
|Property|Description|
|---|---|
|j2ee.deployment-order|Weblogic startup order number that controls when the application starts up. Typically this value will be in the high 300s for application code|
|j2ee.redeploy|Boolean flag to control whether application can be redeployed with same version.|
|j2ee.stage-mode|Weblogic Stage mode for deployment. Valid values are STAGE, NOSTAGE, EXTERNAL_STAGE|
|j2ee.target|List of targets to deploy application to. Can be managed server or cluster|
|strip-version|TODO:|

