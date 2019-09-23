## {{ page.title }}

MyST Studio categorizes errors by codes in the format of `MYST<N>` where `<N>` is a 4 digit number followed by an optional letter. Below is a non-exhaustive list of common error codes within MyST.

| Code | Domain | Category | Description | Message |
|---|---|---|---|---|
|MYST0001	|Generic	|SYSTEM	|Database exception	| An error occurred with the MySTStudio database.|
|MYST0001a	|Generic	|SYSTEM	|Liquibase failed to run successfully.	| An error occurred with your database. The database is out of sync|
|MYST1000	|Generic	|SYSTEM	|Generic system exception	| An unknown technical error occurred while processing your request.|
|MYST1001	|Generic	|APPLICATION	|Generic application exception	| An unknown application error occurred while processing your request.|
|MYST1002	|Generic	|REQUEST	|Generic client exception	| An unknown client exception occurred while processing your request.|
|MYST1003	|Generic	|SYSTEM	|Generic database exception	| An unknown data access exception occurred while processing your request.|
|MYST1010	|Generic	|REQUEST	|Resource not found	| The requested resource was not found in the system.|
|MYST1011	|Generic	|REQUEST	|Duplicate resource	Duplicate record. | The resource already exists in the system.|
|MYST1012	|Generic	|SYSTEM	|Data integrity violation	| Data integrity constraints were violated while trying to persist the necessary entities.|
|MYST1013	|Generic	|REQUEST	|Validation failed	| Validation failed due to bad request parameters.|
|MYST1014	|Generic	|REQUEST	|Validation failed	| Release Pipeline Validation failed due to insufficient data.|
|MYST2000	|Security	|REQUEST	|Bad credentials	The credentials you provided are invalid. | Please try again with the right credentials.|
|MYST2001	|Security	|REQUEST	|Token expired	| You have not passed a valid session token or it has already expired. Please sign in again to renew access.|
|MYST2002	|Security	|APPLICATION	|License invalid	| You do not have a valid license for the product or it has expired.|
|MYST2003	|Security	|APPLICATION	|Not authorized	| You do not have sufficient privileges to perform this action.|
|MYST3000	|Platform Modeling	|REQUEST	|Invalid platform configuration	| The provided blueprint / model configuration failed validation.|
|MYST3500	|Platform Provisioning	|REQUEST	|Invalid platform instance action	| An incorrect action was attempted on the platform instance.|
|MYST3600	|Platform Introspection	|APPLICATION	|Introspection failure	| An error occurred while trying to introspect the target platform.|
|MYST4000	|Continuous Delivery	|APPLICATION	|Delete Failed	| This application blueprint cannot be deleted as it is referred by release pipeline(s)|
|MYST4001	|Continuous Delivery	|APPLICATION	|Delete Failed	| This application blueprint version cannot be deleted it is referred by release pipeline(s)|
|MYST4002	|Continuous Delivery	|APPLICATION	|No CDP Defined	| There is no CDP defined in active state, please define one|
|MYST4003	|Continuous Delivery	|APPLICATION	|Reverse Registration Failed |	Reverse registration of artifact has failed|
|MYST4004	|Continuous Delivery	|APPLICATION	|Deploy Failed	| Release pipeline execution in progress, please retry after some time|
|MYST4005	|Continuous Delivery	|APPLICATION	|Stream Update Failed	| Release pipeline execution in progress, please retry after some time|
|MYST4006	|Continuous Delivery	|REQUEST	|Pipeline Execution Denied	| You can execute a Release pipeline only when it is in active state|
