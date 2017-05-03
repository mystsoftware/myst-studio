## {{ page.title }}

Add certificates that you want to apply to your platform. The properties for applying certificates are listed in the following table. These properties are defined as Global Variables in the Platform Blueprint. 

| Property | Description |
| :--- | :--- |
| certificate\[ID\].file | The file system location of the certificate to be added to the keystore. |
| certificate\[ID\].keystore.location | The location of the keystore on the file system. |
| certificate\[ID\].keystore.password | The password for the keystore. |
| certificate\[ID\].alias | The alias to be used when applying the certificate. |
| certificate\[ID\].keytool.location | The location of the Java keytool. If not set, it defaults to ${[rxr.def.Product-java].home}/bin/keytool |
| certificate\[ID\].machines | Comma-separated list of identifiers for the nodes where the key should be applied. If not set it will default to all of the weblogic machines. |

The following examples shows a sample configuration for applying certificates.

```
certificates=wls-ca,wls-pub
certificate.wls-ca.file=/u02/config/sslcerts
certificate.wls-ca.keystore.location=${[rxr.def.Product-weblogic].home}/server/lib/DemoTrust.jks
certificate.wls-ca.keystore.password=DemoTrustKeyStorePassPhrase
certificate.wls-ca.alias=dss_ca
certificate.wls-ca.keytool.location=${[rxr.def.Product-java].home}/bin/keytool
certificate.wls-ca.machines=rxr.infra.Compute-2,rxr.infra.Compute-1

certificate.wls-pub.file=/u02/config/sslcerts
certificate.wls-pub.keystore.location=${[rxr.def.Product-weblogic].home}/server/lib/DemoTrust.jks
certificate.wls-pub.keystore.password=DemoTrustKeyStorePassPhrase
certificate.wls-pub.alias=dss_ad_pub
certificate.wls-pub.keytool.location=${[rxr.def.Product-java].home}/bin/keytool
certificate.wls-pub.machines=rxr.infra.Compute-2,rxr.infra.Compute-1
```

> They will be applied by  the `Control > Custom > "apply-certificates"` action. Alternatively  you can apply the certificates at provisioning time by adding `action.configure.post=apply-certificates`.


