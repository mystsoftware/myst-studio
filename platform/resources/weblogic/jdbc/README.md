## {{ page.title }}

Configuring JDBC Data Sources in MyST is a two stage process. 
* First, define the Data Source in the Platform Blueprint. Here we define the common and default configuration details for the Data Source. 
* Second, define the environment specific details in each of the Platform Models, for example the database URL and connection credentials.

### Configuring Data Source in Platform Blueprint

#### Add Data Source to Platform Blueprint
To add a new data source in the Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JDBC Data Sources`. Expand this component to see a list of currently defined data sources.

Click on the `+` icon next to JDBC Data Sources (outlined in red). This will create a new Data Source, `Jdbc Data Source - 13` in the example below.

> Note: An alternative way of creating a new Data Source is to select an existing data source, right click on it and select `Clone`.

![](img/createDataSourceStep1.png)

Select the new data source in the tree view, MyST will display its current configuration. Initially, none of its properties will be set. Click `Edit` to put the Data Source into edit mode and enter the required values as detailed in [JDBC Data Source Properties]().

#### Edit Data Source in Platform Blueprint
To edit an existing data source in the Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JDBC Data Sources`. Expand this component to see a list of currently defined data sources and select the data source you wish to edit.

Click `Edit` to put the Data Source into edit mode and enter the required values as detailed in [JDBC Data Source Properties]().

#### Delete Data Source from Platform Blueprint
To delete an existing data source from a Platform Blueprint, open the Platform Blueprint Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JDBC Data Sources`. 

Expand this component to see a list of currently defined data sources. Select an existing data source, right click on it and select `Delete`.

### JDBC Data Source Properties
This section details all the properties that we can set for a JDBC data source in the MyST platform blueprint. To see all properties that are available, ensure `Show advanced properties` has been enabled as illustrated below.

![](img/dataSourceProperties.png)

The majority of these properties are optional. If a property is `Not Set` then MyST will not set that property when configuring a data source, meaning WebLogic will use the default value.

The following section below details each of these properties. It should be noted that most properties are of type `String`. Where this is **not** the case, the type is indicated. Property values of type password are automatically encrypted by MyST.

#### Component Properties
For each JDBC data source we need to specify the following component properties:
* **Name** - Enter a name for this JDBC data source.

* **Type** - The type of data source. Supported types are `generic`, `multi` or `gridlink`. This value defaults to `generic`.

* **Target** - Comma-separated list of JDBC target, which can be either the ServerName or the ClusterName. It is recommended that the target be defined as a MyST property reference rather than a direct value. For example `${[rxr.wls.Cluster-1].name}`.

* **Username** - User name used to connect to the database. This may or may not be a generic value. If it changes per environment then you do not need to set it in your Platform Blueprint.

#### Jdbc Data Source Params
Under `Jdbc Data Source Params` we can specify the following properties:
* **JNDI Name** - Enter the JNDI path to where this JDBC data source will be bound.

* **Global Transactions Protocol** - Use this property to enable non-XA connections from the data source to participate in global transactions.

* **Algorithm Type** - Use this property only when using `Multidatasource`. The algorithm type defines whether you want an active-active (load balancing) or an active-passive (failover) configuration. Supported types are `Load-Balancing` or `Failover`.

* **Data Sources** - Use this only when using `Multidatasource`. Comma-separated list of data sources. If the Algorithm Type is set to `Failover`, the connection request is sent to the first data source in this list. In case the connection fails, the request is sent to the next data source in this list.

* **Failover Request If Busy** - Use this only when using `Multidatasource` and if the Algorithm Type is set to `Failover`. Set this property to `true` if you want to failover the connection request to the next data source if all the connections in the active data source are in busy. `Type: Boolean (true or false)`

#### Jdbc Driver Params
Under `Jdbc Driver Params` we need to specify the following properties:
* **Url** - The JDBC connection URL. 

* **Driver Name** - The fully qualified class name of the JDBC driver class used to create the physical database connections. Ensure that this driver class supports the transaction behavior you have configured in Global Transactions Protocol.

* **Password** - The password used to connect to the database. This should be unique per environments, so should be specified in the Platform Model.

* **Name-Value Parameters** - Optional list of properties passed to the JDBC driver. Use this to pass property values that are not defined in MyST. For each property we need to define the following attributes:
    * **Key** - The property id
    * **Value** - The property value

#### Jdbc Connection Pool Params
Under Jdbc Connection Pool Params we can specify the following properties (if not specified WebLogic will use default values):
* **Capacity Increment** - The number of additional connections created when new connections are added to the connection pool. `Type: Integer`

* **Connection Creation Retry Frequency Seconds** - The number of seconds between attempts to establish connections to the database. `Type: Integer`

* **Initial Capacity** - The minimum number of physical connections to create when creating the connection pool. `Type: Integer`

* **Min Capacity** - The minimum number of physical connections that this connection pool maintains. `Type: Integer`

* **Max Capacity** - The maximum number of physical connections that this connection pool can contain. `Type: Integer`

* **Test Frequency Seconds** - The number of seconds between when WebLogic Server tests unused connections. Requires that you specify a Test Table Name. Connections that fail the test are closed and reopened to re-establish a valid physical connection. If the test fails again, the connection is closed. When set to `0`, periodic testing is disabled. `Type: Integer`

* **Test Connections On Reserve** - Enables WebLogic Server to test a connection before giving it to a client. Requires that you specify a Test Table Name. `Type: Boolean (true or false)`

* **Test Table Name** - The name of the database table to use when testing physical database connections. This name is required when you specify a Test Frequency and enable Test Reserved Connections.

* **Remove Infected Connections** - When set to `true` (which is the default value), the physical connection is not returned to the connection pool after the application closes the logical connection. Instead, the physical connection is closed and recreated. When set to `false`, when the application closes the logical connection, the physical connection is returned to the connection pool and can be reused by the application or by another application. `Type: Boolean (true or false)`

* **Seconds To Trust An Idle Pool Connection** - The number of seconds within a connection use that WebLogic server trusts that the connection is still viable and will skip the connection test, either before delivering it to an application or during the periodic connection testing process. `Type: Integer`

#### Jdbc Oracle Params
Under `Jdbc Oracle Params` we can specify the following properties:
* **Fan Enabled** - Applicable only to RAC configurations. `Type: Boolean (true or false)`

* **Ons Nodes** - JDBC Oracle parameters for ONS client configuration.

### Configure environment specific properties in Platform Model
For each Platform Model we need to define the environment specific values for each Data Source, this typically comprises the following properties:
* **Url** - This is the URL for the database that we want our Data Source to connect to.

* **Username** - User name used to connect to the database.

* **Password** - The password used to connect to the database.

When it comes to defining the `Url` and `Username`, one option is to use MyST properties to minimize the number of specific property values we need to define within the Platform Model.

For example, we could define username as 
```
Username = ${[rxr.def.Product-rcu].param[db-user-prefix]}_STOCK
```

The RCU prefix defined in the Platform Model will then be prepended to `_STOCK` to create the Username. So for example if the RCU prefix was `ACI` we would get the username `ACI_STOCK`.

![](img/modelDataSource.png)

In addition, if we are creating multiple data sources against the same database, another option is to define a global variable in the Platform Blueprint, for example `stockDb.Url` which we can then reference in each Data Source that connects to that database as follows:
```
Url = ${var.stockDb.Url}
```

We will, of course, need to set the value of `stockDb.Url` in the Platform Model, but would only need to set this once, irrespective of how many data sources referenced this.

In addition, we may want to override other settings in the Platform Blueprint as they may differ between environments. For example, we may have smaller connection pools or only be using Oracle RAC in Pre-Prod and Prod.

To edit a data source in the Platform Model, open the Platform Model Editor and navigate to `Blueprint > WebLogic Domains > [domain_name] > JDBC Data Sources`. Expand this component to see a list of currently defined data sources and select the data source you wish to edit.

Any values you enter here will override the corresponding value in the Platform Model. Once done, click `Save` to save these values within the Data Source and then click `Save & Commit` to save the Platform Model and commit our changes.

### Example JDBC Data Source Configurations
The following section contains example JDBC Data Source configurations for:
* Oracle Database
* Oracle RAC
* IBM DB2
* Microsoft SQL Server

#### Creating a JDBC Data Source for Oracle Database
Below is an example configuration for an Oracle DB data source. The properties which are specific to Oracle DB are as follows:

| Property | Value |
| -------- | ----- |
| Type | generic |
| Url | jdbc:oracle:thin:@dbhost:1521/orcl |
| Driver Name | oracle.jdbc.OracleDriver |
| Test Table Name | SQL SELECT 1 FROM DUAL |

An example DB2 data source is shown below.

![](img/oracleDataSource.png)

#### Creating a JDBC Data Source for Oracle RAC
Below is an example configuration for an Oracle RAC data source. The properties which are specific to Oracle RAC in addition to the generic Oracle DB JDBC data source configuration are as follows:

| Property | Value |
| -------- | ----- |
| Type | gridlink |
| Url | jdbc:oracle:thin:@(DESCRIPTION=(ENABLE=BROKEN)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=prod-dc1-scan)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=PRODDB.acme.com))) |
| Fan Enabled | true |
| Ons Nodes | prod-dc1-scan:2016 |

An example Oracle RAC data source is shown below.

![](img/oracleRacDataSource.png)


#### Creating a JDBC Data Source for Microsoft SQL Server
Below is an example configuration for a Microsoft SQL Server data source. The properties which are specific to SQL Server are as follows:

| Property | Value |
| -------- | ----- |
| Type | generic |
| Url | jdbc:weblogic:sqlserver://${var.sql.server.host}:${var.sql.server.port} |
| Driver Name | weblogic.jdbc.sqlserver.SQLServerDriver |

In addition we have specified the following Name-Value Parameters:

| Key | Value |
| -------- | ----- |
| databaseName | ${var.sql.server.sid} |
| portNumber | ${var.sql.server.port} |
| serverName | ${var.sql.server.host} |
| user | ${var.sql.server.user} |

An example SQL Server data source is shown below.

![](img/sqlServerDataSource.png)

#### Creating a JDBC Data Source for IBM DB2
Below is an example configuration for a DB2 data source. The properties which are specific to DB2 are as follows:

| Property | Value |
| -------- | ----- |
| Type | generic |
| Url | jdbc:db2://${var.db2host}:50000/${var.db2name} |
| Driver Name | com.ibm.db2.jcc.DB2Driver |
| Test Table Name | SQL SELECT COUNT(*) FROM SYSIBM.SYSTABLES |

In addition, we have specified the following Name-Value Parameters:

| Key | Value |
| -------- | ----- |
| driverType | 4 |

An example DB2 data source is shown below.

![](img/db2DataSource.png)
