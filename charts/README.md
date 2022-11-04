You don't need to package these charts and publish to a chart repo.
You can just use the path for the chart top-level folder as the chart name without a repo name.

For example, to install the chart in the `mysql` folder you can do:

```
$ pwd 
~/flozano/github/podsec/charts
$ helm install mysql
... hopefully an output that shows helm is happy with these charts and you are logged in on OpenShift
```

Suppose your database pod fails to start because of an error on values, or a non-existant image tag, you could upgrade the release with changed values and fix only the incorrect one.

```
$ helm install mysql mysql \
  --set databaseUser=user \
  --set databasePassword=password \
  --set databaseName=db \
  --set imageTag=8.0-el8
...
$ oc get pod 
NAME                     READY   STATUS         RESTARTS   AGE
mysql-5bc7d46c8c-zfd66   0/1     ErrImagePull   0          5s
$ helm upgrade mysql mysql \
  --set imageTag=1
$ oc get pod 
$ oc get pod
NAME                    READY   STATUS    RESTARTS   AGE
mysql-74cf5ff48-shkbp   1/1     Running   0          2m30s
```

By the way, the previous command does not work as would you expect.
It does not changes only the incorrect value.
All values that were omitted on the upgrade command are replaced with defaults from the chart.
So you end up with a database using unexpected name, user, and password.

```
$ helm get values mysql
USER-SUPPLIED VALUES:
imageTag: 1
$ helm get values -a mysql
COMPUTED VALUES:
databaseName: sampledb
databasePassword: password
databaseRootPassword: secret
databaseUser: user
imageTag: 1
memoryLimit: 512Mi
serviceName: mysql
volumeCapacity: 1Gi
```

Unfortunately for some erros, such as a too small resource limit, You have to uninstall and reinstall the chart with new values. An upgrade of the installed release may not work because the database data directory could be corrupted and in this case you need a clean volume.

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
