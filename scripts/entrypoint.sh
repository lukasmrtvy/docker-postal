#!/bin/bash

if [ ${INIT_CONFIG,,} == true ];then
  eval "cat <<EOF
    $(</opt/postal/config/postal.template.yaml)
EOF
  " | tee /opt/postal/config/postal.yaml 2> /dev/null
fi

if [ ${DB_MIGRATE,,} == true];then
  mysql -h ${main_db.host} -P 3306 -uroot -p mypass -Bse 'GRANT ALL PRIVILEGES ON `postal-%` . * to `postal`@`127.0.0.1`  IDENTIFIED BY "XXX"'
  /opt/postal/bin/postal initialize
fi

if [ "${USER_CREATE,,}" == true]; then
   /opt/postal/bin/postal make-user
fi 

exec "$@"

