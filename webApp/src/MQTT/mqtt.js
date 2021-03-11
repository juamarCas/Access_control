const mqtt = require('mqtt');
const Database = require('../DataBase/db');
const queries = require('../utils/queries');
const topics = require('../utils/mqttTopics'); 
require('dotenv').config();

const db = new Database();

class MQTT {
    //singleton 
    static instance;
    cmqtt; //custom mqtt
    constructor() {
        if (!!MQTT.instance) {
            return MQTT.instance;
        }

        MQTT.instance = this;
        this.options = {
            port: process.env.MQTT_PORT,
            host: process.env.MQTT_HOST,
            clientId: 'acl_server' + Math.round(Math.random() * (0 - 10000) * -1),
            keepalive: 60,
            username: process.env.MQTT_USERNAME,
            password: process.env.MQTT_PASS,
            reconnectPeriod: 1000,
            protocolId: 'MQIsdp',
            protocolVersion: 3,
            clean: true,
            encoding: 'utf8'
        };

        this.cmqtt = mqtt.connect(`mqtt://${process.env.MQTT_HOST}`, this.options);

        this.cmqtt.on('connect', this.#connectSuccesfull);
        this.cmqtt.on('offline', this.#offline);
        this.cmqtt.on('message', this.#messageReceived);

    }

    #connectSuccesfull = () => {
        console.log("I got connected!");
        this.cmqtt.subscribe(topics.topic_apt_bld, () => {
            console.log("I got subscribed!");
        });
    }

    #offline = () => {
        console.log('I\'m offline');
    }

    #messageReceived = (topic, message) => {
        console.log(message.toString());
        console.log(`from topic: ${topic.toString()}`);
        const pool_message = message.toString().split(",");
        const validation = queries.ValidationQuery; //query for entrance validation
        //check if that user exists and if the user has permision to enter
        db.Query(validation, pool_message, (res) => {
            //if the lenght of the object array is not zero, it means it found someone with that id
            //and can enter to the room
            if (res.length) {
                const { user_id, user_name, card_id, room_id } = res[0];
                console.log(user_id);
                console.log("Can pass");
                this.cmqtt.publish(topic.toString() + "/acc", "on");
                const InsertRegister = queries.InsertRegisterQuery;
                const values = [user_name, user_id, card_id, room_id];
                db.query(InsertRegister, values, (res) => {
                    console.log(res); 
                });
            } else {
                //if the object array is empty it means nor the database didn't found anyone with that id
                //or the card id cant pass to that room
                console.log("Can't pass");
                this.cmqtt.publish(topic.toString() + "/acc", "off");
            }
        });
    }


}


module.exports = MQTT; 