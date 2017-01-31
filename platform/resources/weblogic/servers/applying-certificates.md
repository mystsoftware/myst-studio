Add certificates that you want to apply to your platform. You can add these properties to your blueprint or your platform model.

The properties for applying certificates are listed in the following table. These properties are defined under custom properties.



| Property | Description |
| :--- | :--- |
| custom.certificate[ID].file |  	The file system location of the certificate to be added to the keystore. |
| certificate[ID].keystore.location |  The location of the keystore on the file system. |
| certificate[ID].keystore.password | The password for the keystore. |
| certificate[ID].alias | The alias to be used when applying the certificate. |
| certificate[ID].keytool.location | 	The location of the Java keytool. If not set, it defaults to ${core.product[java].home}/bin/keytool  |
| certificate[ID].machines | Comma-separated list of identifiers for the nodes where the key should be applied. If not set it will default to all of the weblogic machines.  |


The following examples shows a sample configuration for applying certificates. 

```
certificates=wls-ca,wls-pub
certificate.wls-ca.file=${myst.workspace}/resources/adcert/gw/rootca
certificate.wls-ca.keystore.location=${core.product[weblogic].home}/server/lib/DemoTrust.jks
certificate.wls-ca.keystore.password=DemoTrustKeyStorePassPhrase
certificate.wls-ca.alias=dss_ca
certificate.wls-ca.keytool.location=${core.product[java].home}/bin/keytool
certificate.wls-ca.machines=${product.weblogic.node-list}
 
certificate.wls-pub.file=${myst.workspace}/resources/adcert/gw/public
certificate.wls-pub.keystore.location=${core.product[weblogic].home}/server/lib/DemoTrust.jks
certificate.wls-pub.keystore.password=DemoTrustKeyStorePassPhrase
certificate.wls-pub.alias=dss_ad_pub
certificate.wls-pub.keytool.location=${core.product[java].home}/bin/keytool
certificate.wls-pub.machines=${product.weblogic.node-list}
```



