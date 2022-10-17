# deploy mysql-minimal.yaml on OpenShift as an unprivleged user (with self-provisioner role)

oc new-project mysql-test && oc create -f mysql--podsecurity.yaml
