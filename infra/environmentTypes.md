# Environment Types
During the lifetime of a project, code will be built and promoted to various staging environments, such as Development (DEV), System Integration Testing (SIT), User Acceptance Testing (UAT), Pre-Production (PRE), and Production (PROD).

Each of these environments is aligned with different stages of the Software Development Lifecycle (SDLC) and is intended for a specific purpose, for example:
* ** DEV**; Used by developers to develop and unit test there code prior to checking into source control. 
* **BLD / CI **; build environment, where committed code is built, as a combined system and unti testing is performed.
* **SIT**: Used testing of a system's integration points with  other systems
* **UAT**: business stakeholders can test against their original business requirements,
* **PRE**: Used to test the deployment process, prior to release into production.
* **PROD**: Production environment, where systems finally get deployed to, for final use by their intended end users.


Within MyST Platform Instances are provisioned into an environment as defined by its Platform Model. 

Environments are used to control who has access to which environmenst in MyST and what actions can be performed.

Each environmet has different






Environments are controlled areas where systems developers can build, distribute, install, configure, test, and execute systems that move through the SDLC. Each environment is aligned with different areas of the SDLC and is intended to have specific purposes. Examples of such environments include the:







Define all the environment types that you want to use in your platform settings. After you define your environment types, you can tag hosts to the environment types. When you build your platform model for an environment, only the hosts tagged to the specific environment show in the list, which you can map to your nodes.

The environment types in your list can be activated or deactivated. Only the active environment types are displayed in the Infrastructure Provider and the Platform Model. Deactivating an existing environment type does not affect the models and infrastructure providers that are currently mapped to the environment type.

Every new environment type that you add is in the active state by default. To deactivate an active environment type, click **Actions > Deactivate**. To activate a deactivated environment type, click **Actions > Activate**.

## Creating a new environment type
The following steps describe how to create a new environment type.

1. To create a new environment type, click **Create New** on the environment types screen.
2. Add a name and description for your environment type.
3. Click **Add** to add the environment type.