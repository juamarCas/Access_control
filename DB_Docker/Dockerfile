FROM mysql:5.7

ENV MYSQL_DATABASE acl

#excecute sql commands when it inits!
COPY ./DB/ /docker-entrypoint-initdb.d/
