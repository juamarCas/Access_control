
#define _SSPIN D4
#define _RSTPIN D3

#define DEBUG 1 //please, when you are going to release, turn this DEBUG to 0, like, #define DEBUG 0

#define waitTime 3000

#include <Arduino.h>
#include <SPI.h>

#include <CustomWiFi.h>
#include <PubSubClient.h>
#include <MFRC522.h>
#include <ArduinoJson.h>
bool hasPassed = false; 

#if DEBUG
  //Debug Variables if needed
#endif

MFRC522 acl(_SSPIN, _RSTPIN); 
CustomWiFi cwifi; 
WiFiClient deviceClient; 
PubSubClient client(deviceClient); 

void reconnect(); 
void SendData(String data); 
void callback(char * topic, byte * payload, unsigned int lenght); 

#if DEBUG
  //Debug functions if needed
  void ShowReaderDetails();
#endif



void setup() {
  SPI.begin(); 
  acl.PCD_Init(); 
  cwifi.begin(); 
  client.setServer(MQTT_SERVER, MQTT_PORT); 
  client.setCallback(callback); 
  pinMode(D0, OUTPUT); 
  pinMode(D1, OUTPUT); 
  //serial begin is in the CustomWiFiLibrary
  #if DEBUG  
    Serial.println("");
    Serial.println("Access control WiFi module v 1.0"); 
    ShowReaderDetails();
  #endif
 
}

void loop() {
  #if DEBUG
    //testing GPIOs
  #endif

  if(!client.connected()){
    reconnect(); 
  } 

  client.loop(); 
  if(!acl.PICC_IsNewCardPresent()) return; //Im not detecting any card
  if(!acl.PICC_ReadCardSerial()) return; //I cant obtain the code for this card
  if(!hasPassed){
    hasPassed = true; 
    String data = ""; 
    for(byte i = 0; i < 4; i++){  
      data += String(acl.uid.uidByte[i]); 
    }
    SendData(data); 
    #if DEBUG
      Serial.println(data); 
    #endif
  }

}

void reconnect(){
  while(!client.connected()){
    #if DEBUG
    Serial.println("Trying to reconnect to MQTT");
    #endif

    String clientID = "esp8266_"; 
    clientID += String(random(0xffff), HEX); 
    if(client.connect(clientID.c_str(), MQTT_USER, MQTT_PASS)){
      client.subscribe("bld1/apt6/room1/acc");
    }else{
      delay(1000); 
    }
  }
}

void SendData(String Data){
  Data+=","+String(ROOM_ID); 
  char msg[50] = ""; 
  Data.toCharArray(msg, 50); 
  client.publish("bld1/apt6/room1", msg); 
}

void callback(char * topic, byte * payload, unsigned int lenght){
  String incomming = "";
  for(unsigned int i = 0; i < lenght; i++){
    incomming += (char)payload[i]; 
  }
  #if DEBUG
  Serial.print("Message incomming: "); 
  Serial.println(incomming); 
  #endif
  if(incomming == "on"){
    //Serial.println("debug"); 
    digitalWrite(16, HIGH); 
  }else{
    digitalWrite(5, HIGH); 
  }
  delay(waitTime);
  digitalWrite(D0, LOW); 
  digitalWrite(D1, LOW); 
  hasPassed = false;
}

#if DEBUG
void ShowReaderDetails() {
  // Get the MFRC522 software version
  byte v = acl.PCD_ReadRegister(acl.VersionReg);
  Serial.print(F("MFRC522 Software Version: 0x"));
  Serial.print(v, HEX);
  if (v == 0x91)
    Serial.print(F(" = v1.0"));
  else if (v == 0x92)
    Serial.print(F(" = v2.0"));
  else
    Serial.print(F(" (unknown),probably a chinese clone?"));
  Serial.println("");
  // When 0x00 or 0xFF is returned, communication probably failed
  if ((v == 0x00) || (v == 0xFF)) {
    Serial.println(F("WARNING: Communication failure, is the MFRC522 properly connected?"));
    Serial.println(F("SYSTEM HALTED: Check connections."));
    while (true); // do not go further
  }
}
#endif