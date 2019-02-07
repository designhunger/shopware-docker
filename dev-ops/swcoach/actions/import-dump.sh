#!/usr/bin/env bash

TTY: docker exec -i -u __USERKEY__ __MYSQL_ID__ mysql -u __DB_USER__ -p__DB_PASSWORD__ -D __DB_NAME__ < dumps/dump.sql
TTY: docker exec -i -u __USERKEY__ __MYSQL_ID__ mysql -u __DB_USER__ -p__DB_PASSWORD__ -e "USE __DB_NAME__; UPDATE s_core_shops SET host='__SW_HOST__', secure=0 WHERE position=0;"
TTY: docker exec -i -u __USERKEY__ -t __APP_ID__ ./shopware/bin/console sw:cache:clear