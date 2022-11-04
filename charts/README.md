You don't need to package these charts and publish to a chart repo.
You can just use the path for the chart top-level folder as the chart name without a repo name.

For example, to install the chart in the `mysql` folder you can do:

```
$ pwd 
~/flozano/github/podsec/charts
$ helm install mysql
... hopefully an output that shows helm is happy with these charts and you are logged in on OpenShift
```
