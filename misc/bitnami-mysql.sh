# installs mysql from a community chart

# cannot start a pod, having pod security issues
# it looks like that chart (or its image) doesn't like OpenShift SCC or recent pod security. :-(

# it does NOT delete its PVC on uninstall

# helm repo add bitnami https://charts.bitnami.com/bitnami

helm install mysql --set auth.database=db --set auth.username=user --set auth.password=password  bitnami/mysql

