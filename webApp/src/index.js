const express = require('express'); 
const mqtt = require('mqtt'); 

const app = express(); 

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

client.on('connect', ()=>{
    console.log("I got connected!");
})

app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})