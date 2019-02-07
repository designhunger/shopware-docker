#!/usr/bin/env bash
#DESCRIPTION: create config file with default data

php -r "require_once __DIR__(sic!).'/dev-ops/common/ConfigHelper.php'; ConfigHelper::createConfig();"