## {{ page.title }}

## Post Deployment Action
Post deployment action can be configured by following the steps from [Configure Postdeployment Action](../#configuring-post-deployment-actions). Once configured create a jenkins job with the job name same as job configured in post deployment actions to trigger jenkins job 

> Note : configure post deployment action with no parameters

Then create one more job with job name as test.&stagename.&applicationblueprinname 
ex:  test.CI.SOABlueprint

Trigger post deployment actions

```groovy
import hudson.model.*
import hudson.AbortException
import hudson.console.HyperlinkNote
import java.util.concurrent.CancellationException
import groovy.json.JsonSlurper
import hudson.EnvVars


EnvVars envVars = build.getEnvironment(listener);

 

// Retrieve parameters of the current build

def payload = build.buildVariableResolver.resolve("jsonpayload")

// println payload

 

def jsonPayloadStr=payload

def jsonSlurper = new JsonSlurper()

def jsonObject = jsonSlurper.parseText(jsonPayloadStr)

 

applicationBlueprintsDeployed=jsonObject.pipeline.data.stream.applications.findAll { it.deployed == true }

 

public class JobExecutionResult {

  String jobName;

  String jobUrl;

  FreeStyleBuild build;

 

  Result result() {

    this.build.result;

  }

 

  double getDurationInSeconds() {

    this.build.getDuration()/1000.0

  }

}

 

public class ExecutionResult {

  int tests;

  int failures;

  int errors;

  int skips;

  long durationInMillis;

 

  def addDuration(long durationToAdd) {

    this.durationInMillis += durationToAdd;

  }

 

  double getDurationInSeconds() {

    this.durationInMillis/1000.0

  }

}

 

def jobExecutionResults = [];

def executionResult = new ExecutionResult(tests: 0, failures: 0, errors: 0, skips: 0, durationInMillis: 0);

 

RESULT=""

overallFailure=false

(applicationBlueprintsDeployed.abpVersion).each {

  stageName=jsonObject.pipeline.data.stage.name

  testJobName="test."+stageName+"."+it.name

  println "The following Application Blueprint test jobs will be executed:" + testJobName

  def job = Hudson.instance.getJob(testJobName)

  def anotherBuild

  try {

    def future = job.scheduleBuild2(0, new Cause.UpstreamCause(build))

    println "Waiting for the completion of " + HyperlinkNote.encodeTo('/' + job.url, job.fullDisplayName)

    anotherBuild = future.get()

    println anotherBuild.getClass();

    } catch (CancellationException x) {

      executionResult.skips++;

      return;

      } catch (Exception x) {

        executionResult.skips++;

        return;

      }

 

      println HyperlinkNote.encodeTo('/' + anotherBuild.url, anotherBuild.fullDisplayName) + " completed. Result was " + anotherBuild.result

 

  // Check that it succeeded

  build.result = anotherBuild.result

 

  // Update the result

  def jobExecutionResult = new JobExecutionResult(jobName: testJobName, jobUrl: anotherBuild.fullDisplayName, build: anotherBuild);

  executionResult.tests++;

 

  if (anotherBuild.result != Result.SUCCESS && anotherBuild.result != Result.UNSTABLE) {

    // We abort this build right here and now.

    //throw new AbortException("${anotherBuild.fullDisplayName} failed.")

   RESULT=RESULT+"   / ${anotherBuild.fullDisplayName} Failed"

    overallFailure=true

    executionResult.errors++;

  }

  else {

    RESULT=RESULT+"   / ${anotherBuild.fullDisplayName} Successful"

  }

  executionResult.addDuration(anotherBuild.getDuration());

  jobExecutionResults.add(jobExecutionResult);

}

 

println "=="

println "=="

println "=============> " + RESULT

println "=="

println "=="

 

// Output executionResult and jobExecutionResults as a junit report.

 

def executionResultsFilename = envVars.get('WORKSPACE') + "/MyST-JobInvoker-TEST.xml";

def executionResultsFile = new File(executionResultsFilename);

executionResultsFile.createNewFile();

 

println "Created execution results file:" + executionResultsFilename;

 

executionResultsFile.write '<testsuite tests="'+ executionResult.tests +'" failures="'+ executionResult.failures + '" skips="' + executionResult.skips + '" errors="0" time="' + executionResult.getDurationInSeconds() + '" name="POC-JobInvoker">\n'

for (JobExecutionResult jobExecutionResult : jobExecutionResults) {

  if (jobExecutionResult.result() == Result.SUCCESS) {

    executionResultsFile.append '<testcase classname="' + jobExecutionResult.jobUrl + '" name="' + jobExecutionResult.jobName + '" time="' + jobExecutionResult.getDurationInSeconds() + '" />\n';

    } else {

      executionResultsFile.append '<testcase classname="' + jobExecutionResult.jobUrl + '" name="' + jobExecutionResult.jobName + '" time="' + jobExecutionResult.getDurationInSeconds() + '" >\n';

      executionResultsFile.append '<failure message="test failure">\n';

      executionResultsFile.append '<![CDATA[' + jobExecutionResult.build.getLog(999) + ']]>';

      executionResultsFile.append '</failure>\n';

      executionResultsFile.append '</testcase>\n';

    }

  }

  executionResultsFile.append '</testsuite>\n'

 

 

// Output the junit report so it appears in the console logs

 

println '\n'

println executionResultsFile.text

println '\n'

 

println '<linkToHTMLReport>'

println envVars.get('BUILD_URL') + 'testReport/junit/';

println '</linkToHTMLReport>'

println '\n'

 

// Do something with the output.

// On the contrary to Parameterized Trigger Plugin, you may now do something from that other build instance.

// Like the parsing the build log (see http://javadoc.jenkins-ci.org/hudson/model/FreeStyleBuild.html )

// You probably may also wish to update the current job's environment.

//build.addAction(new ParametersAction(new StringParameterValue('BAR', '3')))

 

if (overallFailure) {

  throw new AbortException("Tests Failure")

}
```

Trigger post deployment actions reads all the application blueprints deployed, executes application blueprint test jobs and produce job execution results with junit reports





