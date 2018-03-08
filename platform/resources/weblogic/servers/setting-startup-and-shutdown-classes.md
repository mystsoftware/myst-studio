## {{ page.title }}

The startup and shutdown classes enable you to update the WebLogic server targets that you want to execute tasks on when you start or shut down the servers.

### Startup Classes

A startup class is a Java program that is automatically loaded and executed when a WebLogic Server is started or restarted. Set the following properties in the core.domain container to define the startup classes in your platform blueprint.

| Property | Description |
| :--- | :--- |
| Name | A human-readable name for this entriy |
| Targets | Target server(s) or cluster(s) for the startup class. |
| Class Name | Package-qualified name of the class to execute |
| Deployment Order | Lower numbered classes are class-loaded before higher numbered classes |
| Arguments | Arguments that a server uses to initialize a class |
| Run Before Application Deployments | Specifies whether the targeted servers load and run this startup class before activating JMS and JDBC services and before starting deployment for applications and EJBs |
| Run Before Application Activations | Specifies whether the targeted servers load and run this startup class after activating JMS and JDBC services and before activating applications and EJBs |

### Shutdown Classes

A shutdown class is a Java program that is automatically loaded and executed when the WebLogic server is shut down either from the admin console or by running shutdown command. Set the following properties in the core.domain container to define the shutdown classes in your platform blueprint.

| Property | Description |
| :--- | :--- |
| Name | A human-readable name for this entry |
| Targets | Target server(s) or cluster(s) for the shutdown class. |
| Class Name | Package-qualified name of the class to execute |
| Deployment Order | A priority that the server uses to determine when it deploys an item. The priority is relative to other deployable items of the same type |
| Arguments | Arguments that a server uses to initialize a class.  |
