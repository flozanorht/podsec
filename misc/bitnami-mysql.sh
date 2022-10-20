# installs mysql from a community chart

# without many values, it generates a pretty insecure pod security context and collides with both OpenShif SCC and Kubernetes pod security :-(

# it does NOT delete its PVC on uninstall

# helm repo add bitnami https://charts.bitnami.com/bitnami

helm install mysql --version=9.3.5 \
  --set auth.database=db --set auth.username=user --set auth.password=password \
  --set primary.podSecurityContext.enabled=false --set primary.containerSecurityContext.enabled=false \
  --set serviceAccount.create=false \
  --set primary.persistence.size=100Mi \
  bitnami/mysql

# add  primary.resources.requests

# helm upgrade mysql bitnami/mysql --version=9.4.1


