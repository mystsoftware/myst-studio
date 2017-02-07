The security configuration for a WebLogic domain includes the authentication details for logging in to the nodes in assigned to the WebLogic domain.

The security configuration in MyST can contain the following definitions:

* Create LDAP users and groups.
* Assign role conditions.
* Assign users to groups and roles.
* Create, update, and delete credentials maps.
* Create security policies on the JMS modules.

The users, roles, groups, credentials maps, and the security policies must be defined as Global Variables, using the properties below. They will be applied by  the `Control > Custom > "security"` action. Alternatively  you can include it at provisioning time by adding `action.configure.post=security`. \(_**To be clarified\)**_

User parameters

| Property name | Description |
| :--- | :--- |
| add.users | A comma-separated list of user names to be created. |
| &lt;user name&gt;.password | Password for the user name. |
| &lt;user name&gt;.description | Description for the user name. |
| &lt;user name.group&gt; | Comma-separated list of groups to which you want to add the user name. |
| remove.users | Comma-separated list of users you want to remove |

Example

```
add.users=asmith,jstein
asmith.password=welcome1
asmith.group=Administrators
jstein.password=welcome1
```

User group parameters

| Property name | Description |
| :--- | :--- |
| add.groups | Comma-separated list of groups you want to create. |
| remove.groups | Comma-separated list of groups you want to remove. |

Example

```
add.groups=Group1,Group2
```

User role parameters

| Property name | Description |
| :--- | :--- |
| add.app\_roles | Comma-separated list of application role IDs that you want to create. |
| &lt;app role id&gt;.app\_stripe | The name of the application stripe for a given application role id. |
| &lt;app role id&gt;.app\_role\_name | The name of the application role for a given application role id. |
| grant.app\_roles | Comma-separated list of application role grant IDs to be created |
| &lt;grant app role id&gt;.app\_stripe | The name of the application stripe where the role exists. |
| &lt;grant app role id&gt;.app\_role\_name | The name of the application role to be granted for the principal. |
| &lt;grant app role id&gt;.principal\_type | The type of the principal, either "user" or "group". |
| &lt;grant app role id&gt;.principal\_name | The name of the principal to be granted the role |
| role.expressions | A comma-separated list of WebLogic roles to be have their role conditions updated. |
| role.expression.&lt;role&gt; | The role expression for the given role. |
|  |  |

```
add.app_roles=customArchitectRole,
customDeveloperRole

customArchitectRole.app_stripe=soa-infra
customArchitectRole.app_role_name=customArchitectRole

customDeveloperRole.app_stripe=soa-infra
customDeveloperRole.app_role_name=customArchitectRole

grant.app_roles=report-architect-jstein,report-architect-Group1

report-architect-jstein.app_stripe=oracle-bam#11.1.1
report-architect-jstein.app_role_name=Report Architect
report-architect-jstein.principal_type=user
report-architect-jstein.principal_name=jstein

report-architect-Group1.app_stripe=oracle-bam#11.1.1
report-architect-Group1.app_role_name=Report Architect
report-architect-Group1.principal_type=group
report-architect-Group1.principal_name=Group1

role.expressions=Admin,IntegrationAdmin
role.expression.Admin=Grp(Administrators)|Usr(jstein)
role.expression.IntegrationAdmin=
Grp(IntegrationAdministrators)|Grp(Group1)
```

Credentials map parameters

| Property name | Description |
| :--- | :--- |
| credential.maps | Comma-separated list of credential maps. |
| credential.map.&lt;credential map&gt;.keys | Comma-separated list of credential map keys. |
| credential.map.&lt;credential map&gt;.&lt;key&gt;.username | The user name for the credential map key. |
| credential.map.&lt;credential map&gt;.&lt;key&gt;.password | The password for the credential map key. |
| credential.map.&lt;credential map&gt;.&lt;key&gt;.description | The description for the credential map key. |
| credential.map.&lt;credential map&gt;.&lt;key&gt;.present | Specify whether the credential map key should be present or not. If set to false the credential map key is deleted. The default value is set to true. |
| credential.map.&lt;credential map&gt;.&lt;key&gt;.update-if-exists | Specify whether the credential map key should be updated if it already exists. The default value is false, which means that if the credential map key already exists it will not be updated. |

Example

```
credential.maps=oracle.wsm.security
credential.map.oracle.wsm.security.keys=owsm-key
credential.map.oracle.wsm.security.owsm-key.username=DeploymentAdmin_ES
credential.map.oracle.wsm.security.owsm-key.password=welcome1
credential.map.oracle.wsm.security.owsm-key.description=Deployment Administrator
```

The following is an example of a security policies definition created via Global Variables

```
add.policies=myjmsmodule
myjmsmodule.type=jms
myjmsmodule.application=MyJMSModule
myjmsmodule.credential.type=user
myjmsmodule.credential.value=jsmith
```



