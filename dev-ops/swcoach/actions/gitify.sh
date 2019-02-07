#!/usr/bin/env bash

test -e shopware/.gitignore && echo ".gitignore already present" || { cp dev-ops/swcoach/defaults/.gitignore shopware/; echo ".gitignore added"; }

test -e shopware/.gitlab-ci.yml && echo ".gitlab-ci.yml already present" || { cp dev-ops/swcoach/defaults/.gitlab-ci.yml shopware/; echo ".gitlab-ci.yml added"; }