## {{ page.title }}

The startup and shutdown classes enable you to update the WebLogic server targets that you want to execute tasks on when you start or shut down the servers.

### Startup Classes

A startup class is a Java program that is automatically loaded and executed when a WebLogic Server is started or restarted. Set the following properties in the core.domain container to define the startup classes in your platform blueprint.

| Property | Description |
| :--- | :--- |
| Name | A human-readable name for this entriy |
| Target | Comma-separated list of target server or cluster for the startup class. The value can either be a server name or a cluster name. |
| Class Name | Package-qualified name of the class to execute |
| Deployment Order | Lower numbered classes are class-loaded before higher numbered classes |
| Arguments |  |
| Load Before App Deployments |  |
| Load Before App Activation |  |

### Shutdown Classes

A shutdown class is a Java program that is automatically loaded and executed when the WebLogic server is shut down either from the admin console or by running shutdown command. Set the following properties in the core.domain container to define the shutdown classes in your platform blueprint.

| Property | Description |
| :--- | :--- |
| Name | Ahuman-readable name for this entry |
| Target | Comma-separated list of target server or cluster for the startup class. The value can either be a server name or a cluster name. |
| Class Name | Package-qualified name of the class to execute |
| Deployment Order | Comma-separated list of target server or cluster for the startup class. The value can either be a server name or a cluster name. |
|  |  |
| Arguments |  |



