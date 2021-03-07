const fs = require('fs'); 
const path = require('path'); 

const InsertPersonQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','InsertPerson.txt')).toString();
const InsertCardQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','InsertCard.txt')).toString();
const InsertRoomQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','InsertRoom.txt')).toString();
const InsertRegisterQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','InsertLog.txt')).toString(); 

const GetUserByNameQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','GetUserByName.txt')).toString(); 
const ValidationQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','validation.txt')).toString(); 
const GetRegisterByDateQuery = fs.readFileSync(path.join(__dirname,'..','DataBase','GetRegisterByDate.txt')).toString(); 
module.exports = {
    InsertPersonQuery, 
    InsertCardQuery,
    InsertRoomQuery,
    InsertRegisterQuery, 
    GetUserByNameQuery,
    ValidationQuery, 
    GetRegisterByDateQuery

}