#define WIFI_ESP8266

#ifndef CUSTOM_WIFI_H
#define CUTSTOM_WIFI_H
#include "secrets.h"
#include <Arduino.h>
//define in the main.cpp the library you want to use before including this library
#ifdef WIFI_ESP8266
    #include <ESP8266WiFi.h>
#endif

#ifndef ESP_DEBUG
    #define ESP_DEBUG 1
#endif

class CustomWiFi{
    private:
   
    public:
    void begin(); 
    void TryToConnect(); 
    #if ESP_DEBUG
        void PrintData(); 
    #endif
};

#endif