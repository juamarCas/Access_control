const express = require('express'); 
const Database = require('../DataBase/db');
const queries = require('../utils/queries'); 
const router = express.Router(); 

const db = new Database(); 

router.get('/', (req, resp) => {
    db.SelectAll('Logs', (res) =>{
        if(!res.length){
            resp.send("This table is empty"); 
            return; 
        }

        resp.send(res); 
    })
}); 

router.get('/:card_id', (req, resp) =>{
    const {card_id} = req.params;  
    db.SelectOne('Logs', 'log_card_id', card_id, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this card"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
});

router.get('/:person_name', (req, resp) => {
    const {person_name} = req.params;  
    db.SelectOne('Logs', 'log_person_name', person_name, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this name"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
}); 

router.get('/:room_id', (req, resp) => {
    const {room_id} = req.params;  
    db.SelectOne('Logs', 'log_room_id', room_id, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this room"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
}); 

router.get('/:date_begin/:date_finish', (req, resp) =>{
    const {date_begin, date_finish} = req.params;
    const GetLogByDate = queries.GetLogsByDateQuery; 
    db.Query(GetLogByDate, [date_begin, date_finish], (res)=>{
        if(!res.length){
            resp.send("There is no Logs for this time stamp");
            return;  
        }
        resp.send(res);  
    })
}); 

module.exports = router; 