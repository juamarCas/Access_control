# Access control circuit
This section shows the circuit part of the project.</br>
Important note: The circuit uses a relay to activate the secure system, this is a security vulnerability, it can be brokenn with a magnetic attack, this problem can be solved changing the relay for another component like a transistor.</br>

## Running the circuit
1. There is a file called SecretsExample.h, create another file called secrets.h and copy the content from SecretsExample.h to secrets.h, then fill the parameters.
2. The file should look something like: 
```
#ifndef SECRETS_H   
#define SECRETS_H
#define _SSID "your ssid"
#define _PASS "your pass"
#define MQTT_SERVER "mqtt host/ip"
#define MQTT_PORT 1883
#define MQTT_SUBSCRIBE_TOPIC "bld1/apt6/room1/acc"
#define MQTT_PUBLIS_TOPIC "bld1/apt6/room1"
#define MQTT_USER "user_auth"
#define MQTT_PASS "pass_auth"
#define DEBUG 1
#endif
```
</br>
Important note: If you are not using MQTT access control, please skip MQTT_USER and MQTT_PASS, and in the main.cpp in _reconnect_ method, delete the two parameters that are related to this definition.
