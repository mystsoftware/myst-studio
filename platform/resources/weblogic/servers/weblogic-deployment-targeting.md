## {{ page.title }}

The WebLogic Deployment Configuration allows you to list Libraries, Applications and WLDF configurations for deployment to Weblogic.

### Libraries

The library list comprises a list of shared libraries used by the deployed WebLogic applications on target servers. Set the following properties in the platform blueprint to set up the library list.

| Property | Description |
| :--- | :--- |
| Name | A human-readable name for this entry. |
| Targets | Target server(s) or cluster(s) for the library. |

### Applications

The Application deployment configuration specifies where to target your deployed WebLogic applications. Set the following properties to define the application deployment list for the WebLogic domain.

| Property | Description |
| :--- | :--- |
| Name | A human-readable name for this entry. |
| Targets | Target server(s) or cluster(s) for the application. |

### WebLogic Diagnostics Framework \(WLDF\)

The WLDF enables generating, gathering, analyzing, and persisting diagnostic data from WebLogic server instances and from applications deployed to them. Set the following properties to set up the WLDF configuration in the platform blueprint.

| Property | Description |
| :--- | :--- |
| Name | A human readable name for this entry. |
| Targets | Target server(s) or cluster(s) for the WLDF configuration. |
