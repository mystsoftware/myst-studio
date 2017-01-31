The load balancer helps you bring in redundancy and distribute workload across your servers. Add this configuration if you want to include a load balancer in your configuration.

Setting up a load balancer in your platform blueprint requires you to set the following properties.

| Property | Description |
| :--- | :--- |
| core.load-balancer.frontend.ID | The frontend address ID used to reference the frontend when defining managed servers etc. |
| core.load-balancer.frontend\[ID\].host | The frontend host's address. |
| core.load-balancer.frontend\[ID\].http-port | The frontend host's HTTP address. |
| core.load-balancer.frontend\[ID\].https-port | The frontend host's HTTPS address. |



The parameters for the frontend, such the http-port and the host, are environment-specific and need not be specified in a blueprint. In this case, you can enter the value "?" for these parameters, and define them in your platform model. MyST will ensure that you define this value in your platform model at the time of validation. Also, when you define the same parameters in your platform model, the values provided in the platform model will take precedence over the values provided in the platform blueprint.

