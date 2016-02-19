# Compute Definitions

Compute Definitions define what the target OS environment details are within our environment.

Compute definitions contain the operating system requirements for the infrastructure that you define in your blueprint. A compute definition is assigned to compute groups and hosts. Only the hosts that match the compute group operating system requirements can be assigned to the compute group in a blueprint.

You can deactivate a compute definition if you do not want to use it as part of your infrastructure definitions. Deactivating a compute definition does not affect the compute groups or hosts that are mapped to the definition. However, you can not assign the compute definition to any compute group or host after it is deactivated. Only active compute definitions are shown in the list when you want to assign it to a host or compute groups.


## Creating a new compute definition
The following steps describe how to create a new compute definition.
1. Click **Create New**.
2. Enter the following details:
 * **Name** - Name of your compute definition.
 * **OS Type** - The operating system type that you want as part of your compute definition.
 * **OS Distribution** - Select the operating system of your compute definition.
 * **OS Architecture** - Select the operating system architecture of your compute definition.
 * **OS Version** - Select the version of the operating system for your compute definition.
3. Click **Save**. You can also click **Save + Create New** to immediately create a new compute definition after saving the current one.

## Editing a compute definition
The Compute Definitions screen lists all the compute definitions that you have defined. Click **Edit** to edit a compute definition. Note that if you edit a compute definition that is already assigned to a compute group or a host, the compute definition is automatically updated for the compute group and host.