const express = require('express'); 
const mqtt_con = require('./mqtt/mqtt_connect'); 
const db = require('../DataBase/db');
const app = express(); 



mqtt_con.on('connect', ()=>{
    console.log("I got connected!");
    mqtt_con.subscribe("bld1/apt6/+", ()=>{
        console.log("I got subscribed!"); 
    }); 
})

mqtt_con.on('message', (topic, message)=>{
    console.log(message.toString()); 
    console.log(`from topic: ${topic.toString()}`);
    const pool_message = message.toString().split(",");
    //check if that user exists and if the user has permision to enter
    db.query('SELECT * FROM Users INNER JOIN Rooms_cards ON Users.card_id = ? WHERE Rooms_cards.card_id = Users.card_id && Rooms_cards.room_id = ?', 
    pool_message, (err, res, fields) =>{
        if(err){
            console.log(err);
            return; 
        }
        console.log(res);
        if(res.length){
            console.log("Can pass"); 
            mqtt_con.publish(topic.toString() + "/acc", "on"); 
        }else{
            console.log("Can't pass"); 
            mqtt_con.publish(topic.toString() + "/acc", "off"); 
        }
    }); 
}); 

app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})