#!/bin/bash

# debian based os's only

apt-get install runit nodejs build-essential -y
npm install -g node-gyp
# create symlinks
cd /var/www/
mkdir -p socket
cd socket
wget https://github.com/Massivesoft/WebSocket-NodeJS/archive/runit.zip
unzip runit.zip
rm runit.zip
npm install WebSocket-NodeJS-runit
mv WebSocket-NodeJS-runit/server/websocket-server ./
mv WebSocket-NodeJS-runit/server/wss /etc/sv/
ln -s /etc/sv/wss /etc/service/wss
