## {{ page.title }}

For each Platform Instance that we want to create, we need to create a corresponding Platform Model in MyST.

The Platform Model maps the Platform Blueprint to the target infrastructure for our Oracle Middleware platform and provides environment specific configuration details. MyST currently supports two types of infrastructure providers:

* [Pre-Existing](/platform/models/pre-existing/README.md): A Pre-Existing infrastructure provider is one where the hosts onto which the Oracle Middleware will be provisioned have been set-up and configured externally to MyST. Can be used with any existing bare-metal, virtual machines (such as VMWare, Oracle VM), or cloud providers (such as Oracle Cloud, AWS or Azure) that we want to use as the target for hosting our Oracle Middleware platforms.

* [On Demand (AWS)](/platform/models/on-demand-aws/README.md): An On-Demand (AWS) infrastructure provider is one where hosts onto which the Oracle Middleware will be provisioned are created on-demand as part of the process of provisioning the Oracle Middleware platform. This approach relies upon an Amazon Machine Image which is used as a template for the Virtual Machines that are created to underpin the Oracle Middleware platforms.

When we create the Platform Model, we also have the ability to override many of the configurations defined in the Platform Blueprint. This provides a mechanism to safely manage configuration differences between environments. For example, you may want detailed logging levels in a Development or Test environment, but not  in later environments.

Once we have created our Platform Model we are then ready to provision a Platform Instance.

To learn how to create a Platform Model for provisioning on-top of pre-existing infrastructure it is recommended to follow the guide:

 * [Creating a Platform Model for Pre-Existing Infrastructure](/platform/models/pre-existing/README.md)

Alternatively, to learn how to create a Platform Model for on-demand provisioning on the Amazon Web Services (AWS) Cloud it is recommended to follow the guide:

* [Creating a Platform Model for On-Demand AWS](/platform/models/on-demand-aws/README.md)









