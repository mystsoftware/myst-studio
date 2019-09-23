## {{ page.title }}

Some Oracle product artifacts cannot be customised at runtime using the out-of-the-box capabilities. The MyST configuration plan is a solution for performing generic customisations to any artifact type. This can be especially useful for Oracle products that follow an import/export deployment model such as BAM and MFT.

MyST uses a generic configuration plan to take environment properties and applys them to an artifact during deployment.

### Using MyST Configuration Plans with Import/Export Artifacts

There are 3 steps to successfully completing a deployment for export/import.

![](/assets/export-import-steps.png)

### Generic configuration plan moving parts

The configuration plan provides the ability to:

* search and replace a character sequence on a set of files
* specify an XPath, file and replacement value
* expand all myst properties referenced on a set of files

### Example configuration plans

#### Search

Used when you want to
* Make generalizing find and replace rules. e.g. replacing a URL

```
<tns:configplan xmlns:tns="http://myst.rubiconred.com/configplan">    
	<update-list>    
		<update>    
			<fileset>    
				<include name="**/*.xml, **/*.wsdl" />  
				<exclude name="embeddedFTP.xml" />  
			</fileset>   
			<search-replace-list>  
				<search-replace>  
					<search>dev.company.com</search>  
					<replace>${soa.cluster.address}</replace>   
				</search-replace>  
				<search-replace>  
					<search>dev.third-party-services.com</search>  
					<replace>test.third-party-services.com</replace>   
				</search-replace>    
			</search-replace-list>  
		</update>    
	</update-list>    
</tns:configplan>  
```
> Note: The user is able to specify multiple _includes_, _excludes_

#### XPath

Used when you want to

* Change a particular attribute or element
* Want to control at a fine grain level what is changed

> Note: The xpath element is also available as a choice instead of `search` inside `search-replace`

```
<tns:configplan xmlns:tns="http://myst.rubiconred.com/configplan">    
	<update-list>    
		<update>    
			<fileset>    
				<include name="**/source/so_*.xml" />  
			</fileset>   
			<search-replace-list>  
				<search-replace>  
					<xpath>/Source/SourceType/SourceTargetCategory/Technology/TechnologyBinding/FTP/@folder</xpath>    
					<replace>${deployment.mft.AppTransfer.folder}</replace>   
					<action-on-not-found>fail</action-on-not-found>  
				</search-replace>    
			</search-replace-list>  
		</update>  
		<update>    
			<fileset>    
				<include name="**/target/tgt_*.xml" />  
			</fileset>   
			<search-replace-list>  
				<search-replace>  
					<xpath>/Target/TargetType/SourceTargetCategory/Technology/TechnologyBinding/WS/@url</xpath>    
					<replace>http://${soa.cluster.address}/soa-infra/services/default/sca_Customer_1.0?wsdl</replace>   
					<action-on-not-found>warn</action-not-found>  
				</search-replace>    
			</search-replace-list>  
		</update>  
	</update-list>    
</tns:configplan>  
```
When the user specifies xpath, they are also able to specific the behaviour if the XPath is not found via the action-not-found element. The options are:

* fail
* warn
* ignore

### Expand MyST Properties

If you just want to replace all of the properties with values then you can use the expand properties option.

```
<tns:configplan xmlns:tns="http://myst.rubiconred.com/configplan">      
	<update-list>      
		<update>      
			<fileset>      
				<include name="**/**" />  
			</fileset>     
			<search-replace-list>    
				<search-replace>    
					<expandproperties/>    
				</search-replace>      
			</search-replace-list>    
		</update>      
	</update-list>      
</tns:configplan>   
```

### Where it fits into MyST

The use cases are:

* Where Oracle has a product that relies on import/export which doesn't support configuration plans or customization files. e.g. MFT 12.1.3 (MFT 12.2.1 does support configuration plans)

* The existing configuration solution doesn't provide support for customizing the desired property. e.g. OSB files which can't be modified by the OSB customization file

### FAQs

 
| Question | Answer |
| -------- | ------ | 
| Who creates the configuration plan? | The developer. |
| Can we use properties in the replace element? | Yes. If it is an existing property known to MyST it will replace the property |
| Can I specify a search and an xpath? | No. You have a choice on either performing a full search of files mentioned in the includes / excludes, or at a specified xpath location. |
