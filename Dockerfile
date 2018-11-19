FROM amd64/mysql:latest
COPY ./prepare.sql /docker-entrypoint-initdb.d

