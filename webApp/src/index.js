const express = require('express'); 
const mqtt_con = require('./mqtt/mqtt_connect'); 

const app = express(); 

mqtt_con.on('connect', ()=>{
    console.log("I got connected!");
    mqtt_con.subscribe("edf1/apto6/#", ()=>{
        console.log("I got subscribed!"); 
    }); 
})

mqtt_con.on('message', (topic, message)=>{
    console.log(message.toString()); 
}); 

app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})