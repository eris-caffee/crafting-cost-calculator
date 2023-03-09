#!/bin/bash

BASENAME=$(dirname $0)
cd "$BASENAME"

# for some reason I get root's PATH when this script is run as the CMD from a Dockerfile
NVM_BIN_DIR=$(echo /home/crafter/.nvm/versions/node/*/bin/)
PATH=$NVM_BIN_DIR:$PATH

yarn install
yarn start
