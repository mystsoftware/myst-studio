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
|soa.policies|TODO: web service policy|
|soa.service-client|TODO: |
|soa.service-endpoint|TODO: |
|soa.subject|TODO: |

#### OSB
|Property|Description|
|---|---|
|customization-file|OSB customization file to replace endpoint and other properties|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.osb.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.osb.configplan.xml) |

#### MDS
|Property|Description|
|---|---|
|mds.folder-names||
|mds.redeploy||

#### ADF
|Property|Description|
|---|---|
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.adf.configplan.xml) |


#### Java EAR
|Property|Description|
|---|---|
|j2ee.deployment-order||
|j2ee.deployment-plan||
|j2ee.redeploy||
|j2ee.stage-mode||
|j2ee.target||
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) |
|strip-version|||

#### Java WAR
|Property|Description|
|---|---|
|j2ee.deployment-order||
|j2ee.deployment-plan||
|j2ee.redeploy||
|j2ee.stage-mode||
|j2ee.target||
|myst-config-plan-apply|Boolean flag to specify whether to apply myst config plan|
|myst-config-plan-location|MyST configuration plan location to search and replace files with MyST properties. Can be a path on the target host ( [DOMAIN_HOME]/plans/myst.adf.configplan.xml) or a path in the packaged artifact ((EMBEDDED)/myst.j2ee.configplan.xml) 
|strip-version||

#### SQL
|Property|Description|
|---|---|
|sql.client||
|sql.data-source-driver||
|sql.data-source-password||
|sql.data-source-sys-role||
|sql.data-source-url||
|sql.data-source-username||
|sql.delimiter||
|sql.execute||
|sql.fail-on-error||

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
|expand-properties||
|extract-files||
|target-directory||
|target-is-domain-directory||

#### OSB Custom XPath
|Property|Description|
|---|---|
|extract-files||

#### OWSM Policy
|Property|Description|
|---|---|
|extract-files||

#### SOA Extension
|Property|Description|
|---|---|
|||

#### JAR Library
|Property|Description|
|---|---|
|target-directory||
|target-is-domain-directory||

#### Java Shared Library
|Property|Description|
|---|---|
|j2ee.deployment-order||
|j2ee.redeploy||
|j2ee.stage-mode||
|j2ee.target||
|strip-version||

