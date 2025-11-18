## {{ page.title }}

A Direct Upgrade involves taking an existing platform including all of its configuration and migrating it directly. It does not have the many benefits of a Side-by-Side Upgrade and it will require a a longer outage.

#### When to do a Direct Upgrade

As a general rule, Side-by-Side Upgrades are the safest and simplest type of upgrade to execute. However, there are some circumstances where a Direct Upgrade may be the only option.

1. Unavailablity of hardware resources to maintain parallel environments.
2. When we have a lot of model-specific settings in Myst Studio and want to avoid re-creating the Platform Models
3. When our application is architected in a way that we are unable to do a side-by-side upgrade.

#### When not to do a Direct Upgrade

We should avoid doing a Direct Upgrade

1. When we want to be able to rollback immediately in the event of a failure.
2. When we want to minimise downtime or avoid downtime altogether.

#### Types of Direct Upgrades

There are two types of Direct Upgrades:

* [Fresh](/platform/upgrade/direct/fresh/README.md): This involves terminating the current instance and then re-provisioning it on the new version. It is the safest type of Direct Upgrade as it relies on a standard Oracle installation rather than the in-place upgrade tools from Oracle which are less reliable and do not work in all cases.
* [In-place](/platform/upgrade/direct/inplace/README.md) or **State-preserving**: This is the riskiest type of upgrade but it has the benefit of preserving the long running state of existing deployed applications.
