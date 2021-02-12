const mqtt = require('mqtt'); 

const options = {
    port: 1883, 
    host: '192.168.0.109', 
    clientId: 'acl_server' + Math.round(Math.random() * (0 - 10000) * -1),
    keepalive: 60,
    reconnectPeriod: 1000, 
    protocolId: 'MQIsdp', 
    protocolVersion: 3, 
    clean: true, 
    encoding: 'utf8'
}; 

const client = mqtt.connect("mqtt://192.168.0.109", options);

module.exports = client; 