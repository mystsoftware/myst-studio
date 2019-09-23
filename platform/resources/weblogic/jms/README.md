## {{ page.title }}

When configuring the Java Messaging Service (JMS) and Store and Forward (SAF) services, we will typically need to configure some or all of the following resources:

* **JMS Servers** - We will typically want to define a JMS Server for each managed server instance in the targeted cluster. Each JMS Server will need to be pinned to a separate managed server in the cluster.

* **Persistent Store** - We will need to define a dedicated persistence store for each JMS Server. See [Configuring Persistent Stores](/platform/resources/weblogic/jms/persistent-stores/README.md) for further details.


* **JMS Module** - We will typically define a JMS Module targeted at a specific cluster. This acts as a configuration container for JMS Resources, such as:
   * **Sub Deployment** - We will typically define one sub deployment per JMS Module and target it to the set of JMS servers running on the WebLogic Server cluster targeted by the JMS Module
   * **Connection Factories** - Used to create a connection with a JMS provider (i.e. queue or topic).
   * **Uniform Distributed Queue** - A JMS queue for a JMS server 
   * **Uniform Distributed Topic** - A JMS Topic for a JSM server


* **SAF Providers**
   * **SAF Agents** - which perform the actual work of store and forward of JMS messages at runtime
   * **Remote SAF Contexts** - which encapsulate the configuration required to connect to a remote JMS provider
   * **SAF Error Handling** - which encapsulates specific behavior used to process messages in the event of an error
   * **SAF Imported Destinations** - which encapsulate the configuration for specific remote JMS queues that an SAF Agent will interact with
   
This chapter details how to configure JMS and SAF resources and contains the following sections:
* [Persistent Store Configuration](/platform/resources/weblogic/jms/persistent-stores/README.md)
* [Java Message Service (JMS) Configuration](/platform/resources/weblogic/jms/modules/README.md)
* [Store and Forward (SAF) Configuration](/platform/resources/weblogic/jms/store-and-forward/README.md)






























