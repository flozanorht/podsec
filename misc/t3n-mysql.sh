# I think this chart repo is deprecated and not maintained anymore, but the bitnami chart is way too complex :-(

# could specify resource limits and PVC size
# looks like the DB starts with no grants for remote access :-(
# also looks like the user it creates does NOT own the db
# at least it does create a PVC and removes it on unistall -- which may NOT be good for production.

# explictly not using the latest version of the chart so I can test updates
# LoL my upgrade attempt got a CrashLoopBackOff from "InnoDB: Assertion failure" errors
# it looks like the chart was not designed to handle upgrades. :-(
# interesting that the latest release worked fine on first install

# helm repo add t3n https://storage.googleapis.com/t3n-helm-charts

helm install mysql t3n/mysql --version 0.1.0 \
  --set mysqlUser=user \
  --set mysqlPassword=password \
  --set mysqlDatabase=db \
  --set mysqlRootPassword=redhat \
  --set persistence.size=100Mi

# helm upgrade mysql t3n/mysql --version 1.0.0

# when the db is running:
# oc exec -it $(oc get pod -o name -l app.kubernetes.io/name=mysql) -- mysql -uroot -p
# grant all on db.* to user@'%';

