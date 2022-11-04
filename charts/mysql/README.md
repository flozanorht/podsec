This is a minimal chart for deploying a MySQL databse server for development purpuses.

It is inspired by the OpenShift templates mysql-ephemeral and mysql-persistent but using standard Kubernetes APIs instead of OpenShift extension APIs.

This is not a production-grade chart. It does not attempt to initialize databases nor reuse preexisting data from volumes.

Differences from the OpenShift template:

- Parameter names: instead of being uppercase like environment variables, they are camelCase strings and (I hope) more intuitive.

- The "MYSQL_VERSION" parameter is actually an ImageStreamTag and it matches the ImageStreams from the Samples Operator;
The "imageTag" value is a tag from the MySQL image from Red Hat, which is a non-UBI image accessible only to subscribers.
Red Hat Developer users, including users of OpenShift Developer Sandbox and OpenShift Local, are "subscribers" with access to non-UBI images.

- While the template generates random passwords, the chart has default hard-coded values for them.
I know helm can generate random values, I'm just a newbie and I'm still working on that which is my first chart.

- Label: instead of using a "name" label, which I find confusing (it's not metadata.name), I use an"app" label.

- No OpenShift extensions, that is, no DeploymentConfig nor ImageStream.

