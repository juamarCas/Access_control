const express = require('express'); 
const mqtt_con = require('./mqtt/mqtt_connect'); 
const mysql_con = require('../DataBase/db'); 
const MySQL_conn = require('../DataBase/db');
const app = express(); 

const database = new MySQL_conn(); 

mqtt_con.on('connect', ()=>{
    console.log("I got connected!");
    mqtt_con.subscribe("edf1/apto6/+/#", ()=>{
        console.log("I got subscribed!"); 
    }); 
})

mqtt_con.on('message', (topic, message)=>{
    console.log(message.toString()); 
    console.log(`from topic: ${topic.toString()}`); 
}); 

app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})