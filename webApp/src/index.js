const express = require('express'); 
const bodyParser = require('body-parser'); 
const MQTT = require('./MQTT/mqtt'); 
const Authentication = require('./API/Authentication'); 
const Register = require('./API/Register'); 
const Logs = require('./API/logs'); 
const Database = require('./DataBase/db');
const app = express(); 


//MIDDLEWERES
app.use(express.json()); 

//ROUTES
app.use(Authentication); 
app.use('/Register', Register); 
app.use('/Logs', Logs); 

//SERVICES INITIALIZING
const db = new Database();
const mqtt = new MQTT();

//SERVER START
app.set('port', process.env.PORT || 3000); 

app.listen(app.get('port'), ()=>{
    console.log(`Listening on port ${app.get('port')}`); 
})