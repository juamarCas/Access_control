# Access Control
This project consist on a access control system. It uses microcontroller ESP8266 for internet connection, MQTT as my data transfer protocol, NodeJS as the backend programming Language, Express as the framework for the API and MySQL as the Database.</br>

The architecture of the complete project looks like this: </br>

![all text](./images/ProjectArchitecture.png)

# Dockerizing
The project can be executed with containers, for this, there is the _docker-compose.yml_ file, just copy the content of app.env.example and paste it in a new file called app.env same to the db.env.example then fill the data needed in both files, build the two Dockerfile that are in DataBase and webApp and then run the docker-compose.

# Directory
In this section I discribe briefly what is each folder.</br>

## Access_Control
In this folder is the microcontroller project and schematics, is programmed using the PIO IDE.</br>

## DataBase
Thise folder contains the sql file for creating the tables needed.</br>

## HW_Design
This folder includes the KiCad project for the circuit.</br>

## Web-client
This folder includes the frontend of the projects, hasn't started yet this part.</br>

## webApp
This folder includes the NodeJS code for the backend.</br>
