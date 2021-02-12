#include "CustomWiFi.h"
#include "secrets.h"

#define DEBUG 1
#define ESP_DEBUG 1

void CustomWiFi::begin(){
     #if DEBUG
     Serial.begin(9600); 
     #endif
     WiFi.begin(_SSID, _PASS); 
     TryToConnect(); 
}

void CustomWiFi::TryToConnect(){
    while(WiFi.status() != WL_CONNECTED){
        delay(500); 
        #if DEBUG 
        Serial.print(".");
        #endif
    }

    #if DEBUG
        Serial.println("");
        Serial.println("WiFi Connected");
        Serial.println("IP address: ");
        Serial.print(WiFi.localIP()); 
        Serial.println(""); 
    #endif
}

