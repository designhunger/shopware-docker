#!/usr/bin/env bash
set -e
SW_HOST=sw01.localhost
GITLAB=X
if [ ! -d shopware ]
then
if [ ${GITLAB} != X ]
then
git clone ${SW_HOST} shopware && sleep 15s
else
mkdir shopware && sleep 1s
fi
unzip backups/shared.zip -d shopware && ./psh.phar docker:start && sleep 30s && ./psh.phar config-create && sleep 1s && chmod -R 777 dev-ops/docker/_volumes/ && sleep 1s && ./psh.phar swcoach:import-dump && ./psh.phar swcoach:update-hosts && ./psh.phar swcoach:gitify
else
./psh.phar docker:start
fi
case "$OSTYPE" in
  darwin*)	open http://${SW_HOST}/backend ;;
  linux*) 	xdg-open http://${SW_HOST}/backend ;;
  msys*)	start http://${SW_HOST}/backend ;;
esac
