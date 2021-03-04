const express = require('express'); 
const Database = require('../DataBase/db');
const queries = require('../utils/queries'); 
const router = express.Router(); 

const db = new Database(); 

router.get('/', (req, resp) => {
    db.SelectAll('Register', (res) =>{
        if(!res.length){
            resp.send("This table is empty"); 
            return; 
        }

        resp.send(res); 
    })
}); 

router.get('/:card_id', (req, resp) =>{
    const {card_id} = req.params;  
    db.SelectOne('Register', 'register_card_id', card_id, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this card"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
});

router.get('/:user_name', (req, resp) => {
    const {user_name} = req.params;  
    db.SelectOne('Register', 'register_user_name', user_name, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this name"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
}); 

router.get('/:room_id', (req, resp) => {
    const {room_id} = req.params;  
    db.SelectOne('Register', 'register_room_id', room_id, (res) =>{
        if(!res.length){
            resp.send("Couldnt find any log with this room"); 
            return; 
        }

        resp.send(res[0]); 
    }); 
}); 

router.get('/:date_begin/:date_finish', (req, resp) =>{
    const {date_begin, date_finish} = req.params;
    const GetRegisterByDate = queries.GetRegisterByDateQuery; 
    db.Query(GetRegisterByDate, [date_begin, date_finish], (res)=>{
        if(!res.length){
            resp.send("There is no register for this time stamp");
            return;  
        }
        resp.send(res);  
    })
}); 

module.exports = router; 