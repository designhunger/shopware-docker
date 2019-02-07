#!/usr/bin/env bash

TTY: docker exec -i -u __USERKEY__ -t __MYSQL_ID__ mysql -u __DB_USER__ -p__DB_PASSWORD__ -e "DROP DATABASE __DB_NAME__;"