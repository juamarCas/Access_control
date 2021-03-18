const MQTT = require('../mqtt'); 
const queries = require('../../utils/queries');
const Database = require('../../DataBase/db');

const mqtt = new MQTT(); 
const db = new Database();
module.exports = {
    type: "access",
    description: "grant access or deny from the incoming data from topic",
    execute(topic, obj) {
        let answer = {
            "status": "on"
        }
        const card = obj.card.toString(); 
        const room = obj.room.toString(); 
        const validation = queries.ValidationQuery.toString(); 
        //check if that user exists and if the user has permision to enter
        db.Query(validation, [card ,room], (res) => {
            //if the lenght of the object array is not zero, it means it found someone with that id
            //and can enter to the room
            if (res.length) {
                answer.status = "on"; 
                const { person_id, person_name, card_id, room_id } = res[0];
                console.log(user_id);
                mqtt.cmqtt.publish(topic.toString() + "/acc", JSON.stringify(answer));
                const InsertRegister = queries.InsertRegisterQuery;
                const values = [person_name, person_id, card_id, room_id];
                db.Query(InsertRegister, values, (res) => {
                    console.log(res);
                });
            } else {
                //if the object array is empty it means nor the database didn't found anyone with that id
                //or the card id cant pass to that room
                answer.status = "off"; 
                mqtt.cmqtt.publish(topic.toString() + "/acc", JSON.stringify(answer));
            }
        });
    }
}