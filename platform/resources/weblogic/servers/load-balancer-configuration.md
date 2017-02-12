The load balancer helps you bring in redundancy and distribute workload across your servers. Add this configuration if you want to include a load balancer in your configuration.

MyST supports the definition of a load balancer to ensure that server URLs are correctly re-written to route through the load balancer. If you have blocked direct access \(i.e. not via a load balancer\) from the corporate network to your server instances \(which is a generally a recommended good practice\) then the setting of the load balancer will be mandatory otherwise you will find that URLs you expect to be able to access will get blocked.

A load balancer definition in MyST can have many frontend definitions. A frontend represents a host and port combination. If you are providing access from the load balancer front-end over HTTP or HTTPS you should set its port \(typically this is `80` for HTTP and HTTPS `443`\). If you are not providing access to a given port from the load balancer front-end you should set the port to `0` to prevent the server URLs being re-written to route to this protocol erroneously.

# Creating a 

Setting up a load balancer in your platform blueprint requires you to set the following properties.

| Property | Description |
| :--- | :--- |
| Component | The load-balancer ID used to reference the frontend when defining managed servers etc. |
| Host | The frontend host's address. |
| Http Port | The frontend host's HTTP address. |
| Https Port | The frontend host's HTTPS address. |

Some of the parameters for the frontend, such as the host, are environment-specific and need not be specified in a blueprint. In this case, you can enter the value "?" for these parameters, and define them in your platform model. MyST will validate that you have defined this value in your platform model at the time of a platform update or provision. When you define the same parameters in your platform model, the values provided in the platform model will take precedence over the values provided in the platform blueprint.

