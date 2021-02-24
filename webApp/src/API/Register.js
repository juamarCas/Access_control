//This route is to post to the database who passed and get all the register in order
//to see it on the client side
const express = require('express');
const router = express.Router();
const Database = require('../../DataBase/db');
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
    console.log(req.body);
    const { card_id, card_model } = req.body;
    db.query('SELECT * FROM Cards WHERE card_id = ?', [card_id], (err, res, field) => {
        if (err) {
            console.log(err);
            return;
        }
        if (res.length) {
            //if this card exists, means res.length > 0
            resp.send("This card already exist");
            return;
        }

        db.query('INSERT INTO Cards (card_id, model) VALUES (?, ?)',
            [card_id, card_model], (err, res, field) => {
                if (err) {
                    console.log(err);
                    return;
                }

                console.log(res);
                //Show a suceed message! 
            })

    })



});


router.get('/Card', (req, resp) => {
    try {
        db.SelectAll('Cards', (res) => {
            resp.send(res);
        });
    } catch (err) {
        console.log(err);
    }
});


router.get('/Card/:id', (req, res) => {

});


router.post('/Person', (req, resp) => {
    const { user_name, user_lastname, card_id, admin_id } = req.body;
    // First checking if the card exists, if it exists size should be 1, and continue with the normal
    //operation then check if that card is already assigned, if it is assigned then can't
    //register a person
    db.query('SELECT * FROM Cards WHERE Cards.card_id = ?', [card_id], (err, res, field) => {
        if (err) {
            console.log(err);
            return;
        }
        if (!res.length) {
            resp.send("This card does not exist");
            return;
        }

        if (res[0].card_assigned) {
            resp.send("This card is already assigned");
            return;
        }

        db.query('INSERT INTO Users (user_name, user_lastname, card_id, admin_id) VALUES (?, ?, ?, ?)',
            [user_name, user_lastname, card_id, admin_id], (err, res, field) => {
                if (err) {
                    console.log(err);
                    return;
                }

                db.query('UPDATE Cards SET card_assigned = ? WHERE card_id = ?', [true, card_id], (err, res, field) => {
                    if (err) {
                        console.log(err);
                        return;
                    }
                    resp.send("Card and person assigned succesfully");
                })

            });
        /*
        size = res.length; 
        isAssigned = res[0].card_assigned; 
        res.send(res);*/
    });



});

router.get('/Person', (req, resp) => {
    db.SelectAll('Users', (res) => {
        if(!res.length){
           resp.send("This table is empty"); 
           return; 
        }
        resp.send(res);
    });

});

router.get('/Person/:id', (req, res) => {

});

router.post('/Room', (req, resp) => {
    const { room_id, room_name, room_location } = req.body;
    /*
        First ask if this room alreasy exists, if does not exist, insert into the DB
    */
    db.query("SELECT * FROM Rooms WHERE Room_id = ?", [room_id], (err, res, field) => {
        if (res.send) {
            resp.send("This room already exists");
            return;
        }

        db.query('INSERT INTO Rooms (room_id, room_name, room_locarion) VALUE(?, ?, ?)'
        [room_id, room_name, room_location], (err, res, field) => {
            if (err) {
                console.log(err);
                return;
            }

            console.log(res);
            //show success message
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

router.get('/Room/:id', (req, res) => {

});


module.exports = router; 