const mysql = require('mysql'); 
require('dotenv').config()

class MySQL_conn{
    constructor(){
        const connection = mysql.createConnection({
            host : process.env.DB_HOST, 
            port: process.env.DB_PORT,
            user: process.env.DB_USER, 
            password: process.env.DB_PASS, 
            database: process.env.DB
        }); 
        
        connection.connect((err) =>{
            if(err){
                console.log('Error connecting: ', + err.stack); 
                return; 
            }
        
            console.log("Connected to my database!"); 
        });
    }
}


module.exports = MySQL_conn; 
