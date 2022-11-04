You don't need to package these charts and publish to a chart repo.
You can just use the path for the chart top-level folder as the chart name without a repo name.

For example, to install the chart in the `mysql` folder you can do:

```
$ pwd 
~/flozano/github/podsec/charts
$ helm install mysql
... hopefully an output that shows helm is happy with these charts and you are logged in on OpenShift
```

Suppose your database pod fails to start because of an error on values, such as a too small resource limit or a non-existant image tag. You have to uninstall and reinstall the chart with new values. An upgrade of the installed release will not work because the database data directory will be corrupted and you need a clean volume.

```
$ helm install mysql mysql \
  --set databaseUser=user \
  --set databasePassword=password \
  --set databaseName=db \
  --set memoryLimit=128Mi
...
$ oc get pod 
NAME                     READY   STATUS      RESTARTS     AGE
mysql-664f4887db-ttxx6   0/1     OOMKilled   1 (5s ago)   17s
$ oc get pod 
NAME                     READY   STATUS             RESTARTS     AGE
mysql-664f4887db-ttxx6   0/1     CrashLoopBackOff   3 (7s ago)   75s
$ helm upgrade mysql mysql \
  --set memoryLimit=384Mi
$ oc get pod
NAME                     READY   STATUS             RESTARTS     AGE
mysql-67c66f965b-ng4nj   0/1     CrashLoopBackOff   2 (3s ago)   42s
$ helm uninstall mysql
release "mysql" uninstalled
$ helm install mysql mysql \
  --set databaseUser=user \
  --set databasePassword=password \
  --set databaseName=db \
  --set memoryLimit=384Mi
...
$ oc get pod
NAME                     READY   STATUS    RESTARTS   AGE
mysql-67c66f965b-mwjdz   1/1     Running   0          100s
```
