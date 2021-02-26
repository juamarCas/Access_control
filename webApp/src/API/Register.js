//This route is to post to the database who passed and get all the register in order
//to see it on the client side
const express = require('express');
const router = express.Router();
const Database = require('../DataBase/db');
const queries = require('../utils/queries')
const db = new Database();

/*
This are the routes that are in charge with everything it has to be related with registers
like persons, cards and rooms
*/


router.get('/', (req, res) => {
    res.send("b");
    // principal page
});

router.post('/Card', (req, resp) => {
    //Check if this card exists, if not exist, register the card in the db
    console.log(req.body);
    const { card_id, card_model } = req.body;
    const values = [card_id, card_model];
    db.SelectOne('Cards', 'card_id', card_id, (res) => {
        if (res.length) {
            resp.send("This card already exist");
            return;
        }
        const InsertCard = queries.InsertCardQuery;
        db.Query(InsertCard, values, (res) => {
            resp.send("Card registered succesfully");
        })
    })
});


router.get('/Card', (req, resp) => {

    db.SelectAll('Cards', (res) => {
        if (!res.length) {
            resp.send("This table is empty");
        }
        resp.send(res);
    });

});


router.get('/Card/:id', (req, resp) => {
    const {id} = req.params; 
    console.log(id); 
    db.SelectOne('Cards', 'card_id', id, (res) =>{

        if(!res.length){
            resp.send("This card does not exist");
            return;  
        }

        resp.send(res[0]); 
    });
});


router.post('/Person', (req, resp) => {
    const insertPerson = queries.InsertPersonQuery;
    const { user_name, user_lastname, card_id, admin_id } = req.body;
    const values = [user_name, user_lastname, card_id, admin_id];
    // First checking if the card exists, if it exists size should be 1, and continue with the normal
    //operation then check if that card is already assigned, if it is assigned then can't
    //register a person
    db.SelectOne('Cards', 'Cards.card_id', card_id, (res) => {
        console.log(res); 
        if (!res.length) {
            resp.send("This card does not exist");
            return;
        }

        if (res.card_assigned) {
            resp.send("This card is already assigned");
            return;
        }

        db.Query(insertPerson, values, (res) => {
            db.UpdateOne('Cards', 'card_assigned', 'true', 'card_id', `${card_id}`, (res) => {
                resp.send(res);
            });
        });
    });

});

router.get('/Person', (req, resp) => {
    db.SelectAll('Users', (res) => {
        if (!res.length) {
            resp.send("There is no persons registered");
            return;
        }
        resp.send(res);
    });

});

router.get('/Person/:id', (req, resp) => {
    const {id} = req.params; 
    db.SelectOne('Users', 'user_id', id, (res) =>{

        if(!res.length){
            resp.send("This person does not exist");
            return;  
        }

        resp.send(res[0]); 
    }); 
   
});

router.get('/Person/:name/:lastname', (req, resp)=> {
    const {name, lastname} = req.params; 
    const GetUserByName = queries.GetUserByNameQuery; 
    const values = [name, lastname]; 
    db.Query(GetUserByName, values, (res) =>{
        if(!res.length){
            resp.send(`There is no user named ${name} ${lastname}`); 
        }

        resp.send(res[0]); 
    })
})

router.post('/Room', (req, resp) => {
    const { room_id, room_name, room_location } = req.body;
    /*
        First ask if this room alreasy exists, if does not exist, insert into the DB
    */
    db.SelectOne('Rooms', 'room_id', `${room_id}`, (res) =>{
        if(res.length){
            resp.send("This room already exists");
            return; 
        }
        const InsertRoom = queries.InsertRoomQuery; 
        const values = [room_id, room_name, room_location]; 

        db.Query(InsertRoom, values, (res)=>{
            resp.send("The room has been added"); 
            console.log(res);
        })
        
    })
   
});

router.get('/Room', (req, resp) => {
    db.SelectAll('Rooms', (res) => {
        if (!res.length) {
            resp.send("This table is empty");
            return;
        }
        resp.send(res);
    });
});

router.get('/Room/:id', (req, resp) => {
    const {id} = req.params; 
    db.SelectOne('Rooms', 'room_id', id, (res) =>{

        if(!res.length){
            resp.send("This room does not exist");
            return;  
        }

        resp.send(res[0]); 
    });
});


module.exports = router; 