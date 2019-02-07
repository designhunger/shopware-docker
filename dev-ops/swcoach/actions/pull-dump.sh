#!/usr/bin/env bash

TTY: ssh __SSH_USER__@__SW_HOST_PROD__ __MYSQLDUMP_PATH_PROD__ -h __DB_HOST_PROD__ -u __DB_USER_PROD__ -p__DB_PASSWORD_PROD__ __DB_NAME_PROD__ > dumps/dump.sql