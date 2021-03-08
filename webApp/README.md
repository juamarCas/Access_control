# WebApp
This server is made with NodeJS and Express in order to manage all the information that comes from different devices, database management and service routing.

to start running the project as developer: 
1. create a .env file and copy the content from .env.example to .env, example:</br>
```
PORT=3000

DB_HOST=localhost
DB_PORT=3333
DB_USER=root
DB_PASS=root123
DB=access

MQTT_HOST=192.90.0.90
MQTT_PORT=1883
MQTT_USERNAME=username
MQTT_PASS=password
```
</br>
Important note: If you dont implement access control to your MQTT broker, skip the last two variables. In order to test the server is not neccesary the MQTT variables at all, just leave them in blank</br>

2. Run the following command: 
```
npm run dev
```

For more information please read the [API documentation](https://github.com/juamarCas/Access_control/wiki/API-Documentation "API Documentation")

## Services

### Database
For more information go to the [DB_docker folder](https://github.com/juamarCas/Access_control/tree/main/DB_Docker "DB docker folder")

### MQTT
It can be used any MQTT broker software. This project uses EMQX, for more information go to their webpage: [EMQX](https://www.emqx.io/). But it can be Mosquitto for example.

#### MQTT Topics

This section describes how the topics are used in this project, you can modify it as you need.

The topics are managed like the following example: </br>
1. For publishing from the microcontroller to the server: _bld1/apt3/room1_. This means: Building one/apartment 3/room 1
2. Topic where the microcontroller subscribes: _bld1/apt3/room1/acc_. acc is for access, this is called when the server sends a message to granting acces or not to a person.
3. The server is subscribed to: _bld1/apt3/+_ meaning that every message are sent to apartment 3 (three) will be managed by this server. You can add more subscriptions as you need.</br>
4. The server to grant or deny permission publish to the topic where the request is made. For example: If it receive a request from _bld2/apt4/room6_ it send the response in the form {_bld2/apt4/room6_, 'on'} ('on' or 'off' depending if can acces or not). </br>

all the methods and of the MQTT service are in _./src/MQTT/mqtt.js_. for more information go to the _mqtt_ [official library documentation](https://www.npmjs.com/package/mqtt "mqtt library documentation"). </br>

#### MQTT Class and methods
The MQTT class consists in a constructor method that makes the connection to the broker and some private methods that acts as callbacks for the mqtt events. These methods are: </br>
1. #connectSuccesful, this method is called whenever the server has connected to a mqtt broker, in this case, this method only subscribes to a topic.
2. #offline, this method is called whenever the server gets disconnected from the mqtt broker.
3. #messageReceived, this method has two parameters _topic_ and _message_, this method is called whenever the server receive a _message_ from a _topic_ in which the server is subscribed. This method receives the message in the form of <card_id>,<room_id> from the device. Example: a person which card_id is '123456' has passed to the room 'room001' send the following data: '123456','room001' to the server.

