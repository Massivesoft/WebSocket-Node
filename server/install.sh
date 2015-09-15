#!/bin/bash

# debian based os's only

apt-get -y install runit nodejs #build-essential
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
chmod +x websocket-server
chmod +x /etc/service/wss/run
chmod +x /etc/service/wss/log/run
mkdir /etc/service/wss/log/main
sv u -v /etc/service/wss/
