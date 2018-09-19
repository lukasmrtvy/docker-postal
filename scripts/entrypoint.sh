#!/bin/bash


mysql -h localhost -P 3306 -uroot -p mypass -Bse 'GRANT ALL PRIVILEGES ON `postal-%` . * to `postal`@`127.0.0.1`  IDENTIFIED BY "XXX"'



exec "$@"
