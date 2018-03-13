## {{ page.title }}

WebLogic Server provides a number of constraints and request classes used to provide guidelines to WebLogic Server for allocating resources to process work requests, as well as work managers which provide a collection of these constraints and request classes to give an overall behavior. MyST Studio groups configuration for all of these objects under **Work Manager Configuration**.

![](img/workManagerModel.png)

The first displayed entry is `Work Managers`, but because work managers refer to most other object types, we'll come back to those in a moment.

### Configuring Response Time Request Classes

Response Time Request Classes are used to indicate that a given request should be processed within an ideal timeframe, which is expressed in milliseconds. It's important to note that this is not the response time experienced by a client application or end user, but the response time for an individual item of work performed by a server-side component.

![](img/responseTime.png)

To create a response time request class in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Request Classes > Response Time`
2. Click `+` to the right of `Response Time` to add a new response time request class
3. Enter a name for the `Response Time Request Class`. Click `OK`

To configure a response time request class, the following must be provided:

* **Name** - the name displayed for the request class in the WebLogic Admin Console, and used in any configuration referring to the request class

* **Targets** - the server(s) and/or cluster(s) the request class will be targeted to

* **Goal** - ideal response time expressed in milliseconds

### Configuring Fair Share Request Classes

Fair Share Request Classes are used to indicate the percentage of available threads that should be allocated to work during periods where all available worker threads are in use.

![](img/fairShareRequestClasses.png)

To create a fair share request class in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Request Classes > Fair Share`
2. Click `+` to the right of `Fair Share` to add a new fair share request class
3. Enter a name for the `Fair Share Request Class`. Click `OK`

To configure a fair share request class, the following must be provided:

* **Name** - the name used for the request class in the WebLogic Admin Console, and used in any configuration referring to the request class

* **Targets** - the server(s) and/or cluster(s) the request class will be targeted to

* **Fair Share** - the percentage or weighting allocated to work requests using this request class

### Configuring Context Request Classes
Context Request Classes are used to provide specific resource allocation behavior to requests performed under a particular identity context. The behavior of context request classes is determined by individual context cases, each of which specifies either a user or group context, and a specific request class to use for that identity context.

![](img/contextRequestClasses.png)

To create a context request class in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Request Classes >  Context`
2. Click `+` to the right of `Context` to add a new context request class
3. Enter a name for the `Context Request Class`. Click `OK`

To configure a context request class, the following must be provided:

* **Name** - the name used for the request class in the WebLogic Admin Console, and used in any configuration referring to the request class
* **Targets** - the server(s) and/or cluster(s) the request class will be targeted to

### Configuring Context Cases
Context Cases encapsulate how individual identity contexts are treated by a context request class.

To create a context case in MyST Studio, click the `+` button to the right of `Context Cases`

![](img/configuringContextCases.png)

To configure a context case, the following must be provided:

* **Name** - the name used for the context case in the WebLogic Admin Console, and used in any configuration referring to the context case
* Either **User Name** or **Group Name** to indicate the identity context the context case will manage requests for
* **Request Class Name** - the name of another configured request class (either Fair Share or Response Time Request Class) used to manage requests under the defined identity context

### Configuring Maximum Thread Constraints
Maximum Thread Constraints are used primarily to avoid deadlock situations in server processing due to all available threads being allocated to one component when processing requests involving multiple server-side components overall. They are also used to prevent upstream congestion from consuming expensive resources while waiting for limited backend components to complete processing.

![](img/maximumThreadConstraints.png)

To create a maximum thread constraint in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Constraints > Maximum Threads`
2. Click `+` to the right of `Maximum Threads` to add a new maximum threads constraint
3. Enter a name for the `Maximum Threads Constraint`. Click `OK`

To configure a maximum thread constraint, the following must be provided:

* **Name** - the name used for the constraint in the WebLogic Admin Console, and used in any configuration referring to the constraint
* **Targets** - the server(s) and/or cluster(s) the constraint will be targeted to
* **Count** - the maximum number of threads allocated to work managed by this constraint
* **Data Source** - can be used instead of **Count** to size the total number of threads allocated to work based on the maximum size of the specified data source connection pool. Particularly useful for any database connection-bound work.

### Configuring Minimum Thread Constraints
Minimum Thread Constraints are used to help avoid deadlock situations in server processing due to all available threads being allocated to one component when processing requests involving multiple server-side components overall. They are also used to indicate prioritization in situations where all available worker threads are allocated to performing work.

![](img/minimumThreadConstraints.png)

To create a minimum thread constraint in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Constraints > Minimum Threads`
2. Click `+` to the right of `Minimum Threads` to add a new minimum threads constraint
3. Enter a name for the `Minimum Threads Constraint`. Click `OK`

To configure a minimum thread constraint, the following must be provided:

* **Name** - the name used for the constraint in the WebLogic Admin Console, and used in any configuration referring to the constraint
* **Targets** - the server(s) and/or cluster(s) the constraint will be targeted to
* **Count** - the minimum number of threads allocated to work managed by this constraint

### Capacity Constraints
Capacity Constraints are used to provide a guide for how many requests the server should allow to be queued waiting for worker threads before rejecting incoming requests.

![](img/capacityConstraint.png)

To create a capacity constraint in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Constraints > Capacity`.
2. Click `+` to the right of `Capacity` to add a new context request class
3. Enter a name for the `Capacity Constraint`. Click `OK`

To configure a capacity constraint, the following must be provided:

* **Name** - the name used for the constraint in the WebLogic Admin Console, and used in any configuration referring to the constraint
* **Targets** - the server(s) and/or cluster(s) the constraint will be targeted to
* **Count** - the number of requests to allow to be queued for processing before beginning to reject incoming requests for work

### Configuring Work Managers
Work Managers are the higher level components that make use of all of these request classes and constraints to encapsulate a complex set of performance behaviors at runtime. Work Managers are the objects referred to by application configuration to indicate preferred behavior for allocating and managing resources for performing work at runtime.

![](img/workManagers.png)

To create a work manager in MyST Studio:

1. Navigate to `WebLogic Domain Configuration > Work Manager Configuration > Work Managers`
2. Click `+` to the right of `Work Managers` to add a new work manager
3. Enter a name for the `Work Manager`. Click `OK`

To configure a work manager, the following must be provided:

* **Name** - the name used for the work manager in the WebLogic Admin Console, and used in any configuration referring to the constraint
* **Targets** - the server(s) and/or cluster(s) the constraint will be targeted to

The following relationships can be set for a Work Manager

* **Request Class** - the Response Time Request Class, Fair Share Request Class or Context Request Class used by the work manager

* **Minimum Threads Constraint** - the Minimum Threads Constraint used by the work manager

* **Maximum Threads Constraint** - the Maximum Threads Constraint used by the work manager

* **Capacity Constraint** - the Capacity Constraint used by the work manager

The following properties can be set for a Work Manager

* **Ignore Stuck Threads** - whether the work manager should ignore stuck threads

* **Max Thread Stuck Time** - time after which a thread is considered stuck by the work manager

* **Stuck Thread Count** - total number of stuck threads permitted by the work manager before it is shut down

For more information on the configuration of work managers, refer to [Oracle's MBean documentation](https://docs.oracle.com/middleware/1221/wls/WLACH/pagehelp/J2EEappworkworkmanagerconfigtitle.html).
