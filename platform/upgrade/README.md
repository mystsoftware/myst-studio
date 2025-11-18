## {{ page.title }}

In order to get the latest bug fixes and feature enhancements from your Oracle product investments, regular updates need to be applied. Fundamentally, there are two types of updates:

* **One-off patches**: These are provided by Oracle and available for download from [My Oracle Support](http://support.oracle.com) to fix a specific defect or add a minor enhancement. One-off patches can be applied directly through Myst by first [defining them within a Platform Blueprint](/platform/resources/weblogic/patches/README.md) then [applying them to a Platform Instance](/platform/management/README.md).
<!-- TODO: The above link should ideally go to the patching sub-section -->

* **Upgrades**: An upgrade will introduce a significant number of bug fixes and major enhancements in one hit. Without Myst, an upgrade is usually resource intensive and risky. With Myst, an upgrade can be automated which significantly de-risks the upgrade process. This section primarily focuses on this type of upgrade. Upgrades can be either:
 * [Side-by-Side](/platform/upgrade/side-by-side/README.md): also known as *Out-of-place* or *Blue/Green*
 * or [Direct](/platform/upgrade/direct/README.md): also known as *In-place*
