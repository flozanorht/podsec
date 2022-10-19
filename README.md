= Samples of deploying MySQL on OpenShift

Uses Red Hat supported images, so your cluster needs access to the Internet and a pull secret with access to Red Hat registries.

The three YAML files are examples of

* A minmal deployment that just starts a MySQL pod sucessfully

* A recommended examle that adds meets the "production" requirements of setting health probes and resource limits, besides adding a PVC and a secret.

* A minimal deployment with adds pod security attributes to avoid warnings from OCP 4.11 and Kubernetes 1.25

The `misc` folder contains sample scripts of oc and kubectl commands to perform an imperative deployment of the same pod. Well, almost, the imperative examples are currently minimal, so they don't use secrets and PVCs.

The imperative commands also do not set pod security attributes. Interestingly, there are no warnings if using the predefined templates.
