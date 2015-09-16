#!/bin/bash

# debian based os's only

apt-get -y install runit nodejs #build-essential
npm install -g node-gyp
cd /var/www/
mkdir -p socket
cd socket
wget https://github.com/Massivesoft/WebSocket-NodeJS/archive/runit.zip
unzip runit.zip
rm runit.zip
npm install WebSocket-NodeJS-runit
mv WebSocket-NodeJS-runit/server/websocket-server ./
mv WebSocket-NodeJS-runit/server/wss /etc/sv/
chmod +x websocket-server
chmod +x /etc/service/wss/run
chmod +x /etc/service/wss/log/run
mkdir /etc/service/wss/log/main
ln -s /etc/sv/wss /etc/service/wss
sv -v u /etc/service/wss/
sv -v s /etc/service/wss/
