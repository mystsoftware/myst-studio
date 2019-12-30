## {{ page.title }}

###  USER DATA


User Data is set of instructions or commands which will be executed(if given) during the launch of the instance. These instructions are executed only during the initial bootstrap, but not every time when we restart(stop and start) instance.

** Why User Data **

A lot of times during launching a new instance there can be a set of common tasks to perform as part of an initial instance setup procedure. For example if you are launching a lot of instances that are being used as web servers you may want to install Apache on a Linux machine.

The User Data field allows to specify these commands in a command line format which will then execute when the instance is initially launched.

#### Formats of User Data

* As Text
* As File

##### As Text

![](img/AWSUD.png)



In this format the commands are entered in the text box, starting with hashbang(#) and followed by the commands that are to be executed.

##### As File

In this format the user data is written in a file and the file is uploaded instead of giving the data.

In both the formats user data size is limited to 16K KB. If you need to enter the commands greater than 16K KB size, you need to enter the input which is base64 encoded and tick the “Input is already base64 encoded” checkbox.



While setting user data be aware of following :

* User data must be base64-encoded. The Amazon EC2 console can perform the base64-encoding for you or accept base64-encoded input.

* 

