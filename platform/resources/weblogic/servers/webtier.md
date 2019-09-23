The Oracle Web Tier provides the interface between your external load balancer and the applications. This topic helps you understand the basic configuration parameters for Oracle Web Tier that you can define in the platform blueprint. The WebTier configuration is optional, and you can add it only when you need WebTier in your configuration.

Before you begin defining the configuration, the Web Tier must be listed as a product in the product-list in your configuration file.

> Note: When you enable root permissions through the flag core.product\[webtier\].param\[root-permissions-enabled\], it is assumed that the operating system group which owns the home defined by core.product\[webtier\].home is "oracle". If this is not the case, then this property must be overridden with the custom property webtier.oracle.group. For example:

`webtier.oracle.group=dba`

The Oracle HTTP Server in the Web Tier is configured through moduleconf files that you define outside your platform blueprint. The MyST agent references the configuration information from your moduleconf file. A moduleconf file is a standard Oracle HTTP Server configuration. MyST automatically copies moduleconf configuration to the target Oracle HTTP Server hosts and replaces any property references defined in the files with the associated values in configuration. The moduleconf file is stored in the MYST\_WORKSPACE/resources/ohs/moduleconf. This is the default path where MyST tries to locate the moduleconf files to copy to the node. If there is a need to have different moduleconf for environments, then they should be stored in separate folders. For example, if there was a separate OHS configuration for single node and cluster, there should be two folders created as follows:

* MYST\_WORKSPACE/resources/ohs/moduleconf/single
* MYST\_WORKSPACE/resources/ohs/moduleconf/cluster

  If you are using a custom moduleconf source, the folder directory must be defined in the `core.webtier.moduleconf-source.directory` property.The following is a sample moduleconf file located at MYST\_WORKSPACE/resources/ohs/soa\_vh.conf.

```
<VirtualHost *:${core.product[webtier].param[base-port]}>
    ServerName ${core.load-balancer.frontend[fmw].host}:${core.load-balancer.frontend[fmw].http-port}
    RewriteEngine On
    RewriteOptions inherit

# Admin Server and EM
<Location /console>
    SetHandler weblogic-handler
    WebLogicHost ${core.domain.server[admin.server].listen-address}
    WeblogicPort ${core.domain.server[admin.server].listen-port}
</Location>

<Location /em>
    SetHandler weblogic-handler
    WebLogicHost ${core.domain.server[admin.server].listen-address}
    WeblogicPort ${core.domain.server[admin.server].listen-port}
</Location>

# WSM-PM
<Location /wsm-pm>
    SetHandler weblogic-handler
    WebLogicCluster ${core.webtier.cluster[wsm].server-addresses}
</Location>

# SOA infra
<Location /soa-infra>
    SetHandler weblogic-handler
    WebLogicCluster ${core.webtier.cluster[soa].server-addresses}
</Location>

</VirtualHost>
```

Note: **Special property for server addresses**

When routing to the multiple nodes in a cluster the WebLogicCluster property in the OHS moduleconf would typically be set as follows:

```
${core.server[soa.server1].listen-address}:${core.server[soa.server1].listen-port},${core.server[soa.server2].listen-address}:${core.server[soa.server2].listen-port}
```

...which would resolve to WebLogicCluster soa-machine01:8001,soa-machine02:8001. To simplify this, there is a property that is dynamically created at runtime, which can be used to automatically retrieve this list of server addresses. This property is core.webtier.cluster\[CLUSTER-ID\].server-addresses. At run time, it will automatically create the server list as above without the need to explicitly define all the listen-address and listen-port elements of the servers in the cluster.

In addition to the moduleconf definition, the following table describes the configuration properties that you must set for Web Tier in the platform blueprint.

| Property | Description |
| :--- | :--- |
| core.webtier.node\[ID\].instance-home | The Oracle HTTP Server instance home. |
| core.webtier.node\[ID\].component-name | The Oracle HTTP Server component name. |
| core.webtier.name-virtual-host-enabled | Specifies whether to enable name-based virtual hosts or not. |
| core.webtier.moduleconf-source.directory | The location of the moduleconf files, which are replaced with variables and copied to the server. If not set, the default location is taken as ${myst.workspace}/resources/ohs/moduleconf |
| core.webtier.moduleconf-source.allow-unexpanded-properties | Allows unexpanded properties to be defined in the moduleconf. This is required to allow adding the Oracle HTTP Server properties that are not related to the MyST properties. If not set, the default is set to false. If set to true, the user running MyST must have sudoers NOPASSWD access to the system. |
| core.webtier.cluster\[ID\].server-addresses | Computed from core.domain.server\[_\].listen-address and core.domain.server\[_\].listen-port for all servers within the cluster. |
|  | core.product\[webtier\].param\[webcache-enabled\] |
| core.product\[webtier\].param\[opmn-remote-port\] | The Oracle Process Manager and Notification \(OPMN\) remote port. If not set, the default value is taken as 6701. |
| core.product\[webtier\].param\[opmn-local-port\] | The Oracle Process Manager and Notification \(OPMN\) local port. If not set, it defaults to 6700 |
| core.product\[webtier\].param\[base-port\] | Listen port for the Oracle HTTP Server component. If not set, the default value is taken as 7777. |
| core.load-balancer.frontend\[ID\].https-port | The frontend load balancer HTTPS port. |
| core.load-balancer.frontend\[ID\].http-port | The frontend load balancer HTTP port. |
| core.load-balancer.frontend\[ID\].host | The front-end load balancer host. |



> Note: The above configuration contains only the details required for the Oracle HTTP Server configuration. However, typically there are a number of additional configuration properties which are also required for WebLogic server configuration as well. By defining the Oracle HTTP Server and WLS configuration in the same definition, it is possible to perform the Oracle HTTP Server configuration at the same time as WebLogic server configuration. To do this, add the configure-webtier action to the start of the definition of the provision flow as follows:

| Property | Description |
| :--- | :--- |
| action.configure.pre | configure-webtier,stop-via-as,stop-nm,stop,create-domain,patch-domain,apply-jrf,start-nm,start,configure-nm,create-resource,reassociate-security-store,stop,copy-domain,start-as-via-nm,start-via-as,configure-soa,configure-ums |
| action.provision.pre | install,configure |



