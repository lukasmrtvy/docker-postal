#!/bin/bash

if [ ${DB_MIGRATE,,} == true];then
  mysql -h ${main_db.host} -P 3306 -uroot -p mypass -Bse 'GRANT ALL PRIVILEGES ON `postal-%` . * to `postal`@`127.0.0.1`  IDENTIFIED BY "XXX"'
fi

if [ "${USER_CREATE,,}" == true]; then
   postal make-user
fi 

TODO

exec "$@"
