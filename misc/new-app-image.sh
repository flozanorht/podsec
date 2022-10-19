# create a mysql server pod from the persistent template

oc new-app --name mysql --image registry.redhat.io/rhel8/mysql-80:1 \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_ROOT_PASSWORD=redhat \
  -e MYSQL_DATABASE=db 

