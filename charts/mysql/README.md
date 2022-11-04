This is a minimal chart for deploying a MySQL databse server for development purpuses.

It is inspired by the OpenShift templates mysql-ephemeral and mysql-persistent but using standard Kubernetes APIs instead of OpenShift extension APIs.

This is not a production-grade chart. It does not attempt to initialize databases nor reuse preexisting data from volumes.
