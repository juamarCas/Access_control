const mqtt = require('mqtt');
const fs = require('fs'); 
const path = require('path'); 
const Map = require('collections/_map'); 
const topics = require('../utils/mqttTopics'); 
require('dotenv').config();
class MQTT {
    //singleton 
    static instance;
    cmqtt; //custom mqtt
    map; 
    constructor() {
        if (!!MQTT.instance) {
            return MQTT.instance;
        }

        //map will held all the methods 
        this.map = new Map();

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

        const topicFiles = fs.readdirSync(path.join(__dirname, 'commands')).filter(file => file.endsWith('.js')); 
        for(const file of topicFiles){
            const command = require(`./commands/${file}`); 
            this.map.set(command.type, command); //save this instruction to the array
        }

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
        const obj = JSON.parse(message.toString()); 
        const key = obj.type.toString(); 
       
        if(!this.map.has(key)) return; //if this command does not exist, just return
 
        const command = this.map.get(key); 
        
        try{
            command.execute(topic, obj); 
        }catch(err){    
            console.log(err); 
        }
    }


}


module.exports = MQTT; 