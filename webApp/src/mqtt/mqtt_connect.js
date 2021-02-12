const mqtt = require('mqtt'); 
require('dotenv').config(); 
const options = {
    port: process.env.MQTT_PORT, 
    host: process.env.MQTT_HOST, 
    clientId: 'acl_server' + Math.round(Math.random() * (0 - 10000) * -1),
    keepalive: 60,
    username: process.env.MQTT_USERNAME,
    password: process.env.MQTT_PASS,
    reconnectPeriod: 1000, 
    protocolId: 'MQIsdp', 
    protocolVersion: 3, 
    clean: true, 
    encoding: 'utf8'
}; 

const client = mqtt.connect("mqtt://192.168.0.109", options);

module.exports = client; 