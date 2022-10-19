# create a mysql server pod from the persistent template

kubectl create deployment mysql --image registry.redhat.io/rhel8/mysql-80:1

kubectl set env deployment mysql \
  MYSQL_USER=user \
  MYSQL_PASSWORD=password \
  MYSQL_ROOT_PASSWORD=redhat \
  MYSQL_DATABASE=db 

kubectl expose deployment mysql --port 3306

