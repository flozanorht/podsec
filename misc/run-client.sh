# run a pod for a mysql client
# inside the pod, run the mysql client, for example
# mysql -hmysql -uuser -p db

#oc run client -it --image registry.redhat.io/rhel8/mysql-80:1 bash

# Have to remember to type the password
oc run client -it --rm --image registry.redhat.io/rhel8/mysql-80:1 -- mysql -hmysql -uuser -p db

