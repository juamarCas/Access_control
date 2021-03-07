# WebApp


# MQTT
For the MQTT broker I decided to use EMQX installed in my raspberry PI 4, but it can be other software like Mosquitto. You can read more info in their webpage: [EMQX](https://www.emqx.io/). 

## MQTT Topics

This section I will describe how the topics are used in this project, you can modify it as you want.

The topics are managed like the following example: </br>
1. For publishing from the microcontroller to the server: _bld1/apt3/room1_. This means: Building one/apartment 3/room 1
2. Topic where the microcontroller subscribes: _bld1/apt3/room1/acc_. acc is for access, this is called when the server sends a message to granting acces or not to a person.
3. The server is subscribed to: _bld1/apt3/+_ meaning that every message are sent to apartment 3 (three) will be managed by this server. You can add more subscriptions as you need.</br>