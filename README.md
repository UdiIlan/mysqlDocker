# mysqlDocker
mysql docker file with preconfigured tables


* to build the docker file run :
docker build -t <new-image-name> .

for example : docker build -t mysql:gadi .

* docker run -d --name <new-container-name> -p 3306:3306 --volume=<local-path-to-mount-data>:/var/lib/mysql -e  MYSQL_ROOT_PASSWORD=<root-password-for-the-connection>  <new-image-name> /entrypoint.sh --default-authentication-plugin=mysql_native_password

for example : docker run -d --name mysql-gadi -p 3306:3306 --volume=C:/temp:/var/lib/mysql -e  MYSQL_ROOT_PASSWORD=1234  mysql:gadi /entrypoint.sh --default-authentication-plugin=mysql_native_password
