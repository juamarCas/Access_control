//This route is to post to the database who passed and get all the register in order
//to see it on the client side
const express = require('express'); 
const { route } = require('.');
const router = express.Router(); 
const db = require('../../DataBase/db');

/*
This are the routes that are in charge with everything it has to be related with registers
like persons, cards and rooms
*/

router.get('/', (res, req) => {
 // principal page
}); 

router.post('/Card', (res, req) => {
    const {card_id, card_model} = req.body; 
    db.query('INSERT INTO Cards (card_id, model) VALUES (?, ?)', 
    [card_id, card_model], (err, res, field) =>{
        if(err){
            console.log(err); 
            return; 
        }

        console.log(res);
        //Show a suceed message! 
    })
}); 




router.get('/Card', (req, res) => {

}); 


router.get('/Card/:id', (req, res) => {

}); 


router.post('/Person', (req, res) =>{
    const {user_name, user_lastname, card_id, admin_id} = req.body; 

    // First checking if the card exists, if it exists size should be 1, and continue with the normal
    //operation then check if that card is already assigned, if it is assigned then can't
    //register a person

    let size = 0; 
    let isAssigned; 
    db.query('SELECT * FROM Cards WHERE Cards.card_id = ?', [card_id], (err, res, field) =>{
        if(err){
            console.log(err); 
            return; 
        }

        size = res.length; 
        isAssigned = res[0].card_assigned; 
        res.send(res); 
    });

    if(!size.length){
        //Send a message "The card does not exist"
        return;  
    }  

    if(isAssigned){
        //Send message "This card has been assigned"
        return; 
    }

    db.query('INSERT INTO Users (user_name, user_lastname, card_id, admin_id) VALUES (?, ?, ?, ?)', 
    [user_name, user_lastname, card_id, admin_id], (err, res, field) =>{
        if(err){
            console.log(err); 
            return; 
        }

        console.log(res); 
        //show a succeed message! 
    }); 
}); 

router.get('/Person', (req, res) =>{

}); 

router.get('/Person/:id', (req, res) => {

}); 

router.post('/Room', (req, res) => {

}); 

router.get('/Room', (req, res) =>{

}); 

router.get('/Room/:id', (req, res) => {

}); 


module.exports = router; 