const express = require('express'); 
const bodyParser = require('body-parser'); 
const mqtt_con = require('./mqtt/mqtt_connect'); 
const db = require('../DataBase/db');
const router = require('./API/index'); 
const Authentication = require('./API/Authentication'); 
const Register = require('./API/Register'); 
const Logs = require('./API/logs'); 
const app = express(); 


//MIDDLEWERES
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json()); 

//ROUTES
app.use(router); 
app.use(Authentication); 
app.use('/Register', Register); 
app.use('/Logs', Logs); 


//MQTT LOGIC
mqtt_con.on('connect', ()=>{
    console.log("I got connected!");
    mqtt_con.subscribe("bld1/apt6/+", ()=>{
        console.log("I got subscribed!"); 
    }); 
})

mqtt_con.on('offline', ()=>{
    console.log('I\'m offline'); 
}); 

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
        //if the lenght of the object array is ot zero, it means it found someone with that id
        //and can enter to the room
        if(res.length){
            const {user_id, user_name, card_id, room_id} = res[0]; 
            console.log(user_id); 
            console.log("Can pass"); 
            mqtt_con.publish(topic.toString() + "/acc", "on"); 
            db.query("INSERT INTO Register (register_user_name, register_user_id, register_card_id, register_room_id) VALUES (?, ?, ?, ?)", 
            [user_name, user_id, card_id, room_id], (err, res, fields) =>{
                if(err){
                    console.log(err); 
                    return; 
                }
                console.log(res); 
            }); 
        }else{
            //if the object array is empty it means nor the database didn't found anyone with that id
            //or the card id cant pass to that room
            console.log("Can't pass"); 
            mqtt_con.publish(topic.toString() + "/acc", "off"); 
        }
    }); 
}); 

//SERVER START
app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})