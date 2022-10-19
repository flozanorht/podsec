# create a mysql server pod from the persistent template

oc new-app --template mysql-persistent \
  -p MYSQL_USER=user \
  -p MYSQL_PASSWORD=password \
  -p MYSQL_ROOT_PASSWORD=redhat \
  -p MYSQL_DATABASE=db \
  -p VOLUME_CAPACITY=100Mi \
  -p MEMORY_LIMIT=512Mi

