#!/bin/bash

# debian based os's only

apt-get install runit nodejs build-essential -y
npm install -g node-gyp
# create symlinks
cd /var/www/
mkdir -p socket
cd socket
npm install https://github.com/Massivesoft/WebSocket-NodeJS/archive/runit.zip
