#!/usr/bin/env bash

TTY: docker exec -i -u __USERKEY__ __MYSQL_ID__ mysqldump -u __DB_USER__ -p__DB_PASSWORD__ __DB_NAME__ > dumps/dump.sql