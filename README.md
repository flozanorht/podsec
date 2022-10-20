== Samples of deploying MySQL on OpenShift

Uses Red Hat supported images, so your cluster needs access to the Internet and a pull secret with access to Red Hat registries.

The three YAML files are examples of

* A minmal deployment that just starts a MySQL pod sucessfully

* A recommended examle that adds meets the "production" requirements of setting health probes and resource limits, besides adding a PVC and a secret.
These examles could probably be improved with start up probes. Anything else?

* A minimal deployment with adds pod security attributes to avoid warnings from OCP 4.11 and Kubernetes 1.25

The `misc` folder contains sample scripts of oc and kubectl commands to perform an imperative deployment of the same pod.
Well, almost... the imperative examples are currently minimal, so they don't use secrets and PVCs.
Unless they use templates or helm charts.
Yes, the samples are somewhat uneven.

The imperative commands also do not set pod security attributes.
Interestingly, there are no warnings if using the predefined templates.
I guess the warnings are just not displayed by oc new-app.
Maybe they exist as events?

The examples of helm chart use whatever community images are the default for their respective charts.
I have no idea if these charts can use Red Hat images or if there are charts for Red Hat images.
But the chart examples work as a "regular" self-service developer without special privileges and without custom SCCs.
