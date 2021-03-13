const MQTT = require('../mqtt'); 
const queries = require('../../utils/queries');
const Database = require('../../DataBase/db');

const mqtt = new MQTT(); 
const db = new Database();
module.exports = {
    name: "access",
    description: "grant access or deny from the incoming data from topic",
    execute(topic, message) {
        console.log(`Message incoming from topic: ${topic}`);
        console.log(`Content: ${message}`)
        const pool_message = message.toString().split(",");
        const validation = queries.ValidationQuery;
        //check if that user exists and if the user has permision to enter
        db.Query(validation, [pool_message[0] ,pool_message[1]], (res) => {
            //if the lenght of the object array is not zero, it means it found someone with that id
            //and can enter to the room
            if (res.length) {
                const { user_id, user_name, card_id, room_id } = res[0];
                console.log(user_id);
                console.log("Can pass");
                mqtt.cmqtt.publish(topic.toString() + "/acc", "on");
                const InsertRegister = queries.InsertRegisterQuery;
                const values = [user_name, user_id, card_id, room_id];
                db.query(InsertRegister, values, (res) => {
                    console.log(res);
                });
            } else {
                //if the object array is empty it means nor the database didn't found anyone with that id
                //or the card id cant pass to that room
                console.log("Can't pass");
                mqtt.cmqtt.publish(topic.toString() + "/acc", "off");
            }
        });
    }
}