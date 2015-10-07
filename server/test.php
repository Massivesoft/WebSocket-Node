<!DOCTYPE html>
<meta charset="utf-8" />
<title>WebSocket Test</title>
<script language="javascript" type="text/javascript">
<?php
$ip = preg_replace("/[^a-f0-9\.:]/i", "", file_get_contents("http://icanhazip.com"));
if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4)) {
        // do nothing
} else if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6)) {
        $ip = "[$ip]";
} else {
        $ip = "{$_SERVER['SERVER_ADDR']}";
}
// be careful when using an IP with SSL certificates
?>
var wsUri = "ws<?php echo (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 's' : ''; ?>://<?php echo $ip; ?>:8888";
var output;
function init() {
  output = document.getElementById("output");
  testWebSocket();
}
function testWebSocket() {
  websocket = new WebSocket(wsUri, "echo");
  websocket.onopen = function(evt) {
    onOpen(evt)
  };
  websocket.onclose = function(evt) {
    onClose(evt)
  };
  websocket.onmessage = function(evt) {
    onMessage(evt)
  };
  websocket.onerror = function(evt) {
    onError(evt)
  };
}
function onOpen(evt) {
  writeToScreen("CONNECTED");
  doSend("WebSocket rocks");
}
function onClose(evt) {
  writeToScreen("DISCONNECTED");
}
function onMessage(evt) {
  writeToScreen('<span style="color: blue;">RESPONSE: ' + evt.data+'</span>');
  websocket.close();
}
function onError(evt) {
  writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data);
}
function doSend(message) {
  writeToScreen("SENT: " + message);
  websocket.send(message);
}
function writeToScreen(message) {
  var pre = document.createElement("p");
  pre.style.wordWrap = "break-word";
  pre.innerHTML = message;
  output.appendChild(pre);
}
window.addEventListener("load", init, false);
</script>
<h2>WebSocket Test</h2>
<div id="output"></div>
