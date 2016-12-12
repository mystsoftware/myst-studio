



### Setup global variables in Jenkins

Go the Jenkins console at https://mattwright-vci.testdrive.fusioncloud.com
Click on `Manage Jenkins`
Click on `Configure System`
Click on the Environment variables checkbox under Global properties

Then click Add to add the following variables. 
* **MAVEN_REPO_URL** -  Software Repository
* **FMW_HOME** = /u01/app/oracle/product/fmw1221

We will re-use these variables later in our automated jobs.

### Create OSB Automated Build Job

Click on New Item
Enter the Item Name as com.acme-StockServices and select `Maven project`

Click Ok
Under Source Code Management select Subversion.
Enter the Repository URL as svn://mattwright-myst.testdrive.fusioncloud.com/repos/code/trunk/12.2.1/Stock/src/osb. You can leave all the other defaults.
Under Build Triggers tick Poll SCM and enter the schedule as * * * * * which means to poll every minute.

Click on `Add pre-build step` and then select `Invoke top-level Maven targets`

Select Maven as the Maven Version and enter the following into the Goals field build-helper:parse-version versions:set '-DnewVersion=${parsedVersion.majorVersion}.${parsedVersion.minorVersion}-${BUILD_NUMBER}'. This tells Maven to always append the build number to the artifact version.

Go to the Build section and enter Stock/pom.xml for the Root POM and clean package -DoracleHome=$FMW_HOME for the Goals and options field.

Click Save. This will take you back to the main job screen.
After a short time, you should see that the build has been automatically kicked off. 
Click on progress bar to see the Console Output.

You've now successfully built an OSB project using Jenkins. Now that Maven has downloaded all of the build dependencies, future builds should be significantly faster.

### Update Build Job to publish to Artifactory
Click on the com.acme-StockServices job.
Then click on Configure
Navigate to Build and add the following to the end of the Goals and options 
```
install:install deploy:deploy - DaltDeploymentRepository=central::default::$MAVEN_REPO_URL
```

Click Save
Click on Build now
You should now see Build #2 running in the Build History. Click on the progress bar to see the Console Output.

### Update Build job to register artifact with MyST Studio
From the Jenkins console click on the com.acme-StockServices job.
Click on Configure
Navigate to the bottom of the page where it shows Post-build Actions
Click on Add post-build action and then select Publish to MyST Studio 

Make sure the Active box is ticked.

Click on Build Now
Click on the progress bar for the job that appears in the Build History to go to the Console Output.
At the end of the output you should see an output similar to the following
```
{
  "buildNumber": "3",
  "startTime": "2016.06.09 at 04:24:45 UTC",
  "endTime": "2016.06.09 at 04:25:32 UTC",
  "status": "SUCCESS",
  "component": {
    "componentType": "ofmw-osb",
    "description": "",
    "mavenModel": {
      "groupId": "com.acme",
      "artifactId": "StockServices"
    },
    "binaryVersion": "1.0-3",
    "managedBy": "CI_SERVER",
    "buildStatus": "BUILT",
    "metadata": {
      "artifact.repository.type": "sbar"
    },
    "name": "StockServices",
    "topLevel": true
  },
  "scmState": {
    "url": "svn://mattwright-myst.testdrive.fusioncloud.com/repos/code/trunk/12.2.1/Stock/src/osb",
    "branch": "NA",
    "commit": "3"
  }
}
```
Your OSB artifact has now been published to MyST Studio.

Observe the registered artifacts in Studio