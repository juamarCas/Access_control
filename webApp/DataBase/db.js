const mysql = require('mysql');

require('dotenv').config()

class Database {
    static instance; 
    database; 
    constructor() {
        
        if(!!Database.instance){
            return Database.instance; 
        }

        Database.instance = this; 
        
        this.database = mysql.createConnection({
            host: process.env.DB_HOST,
            port: process.env.DB_PORT,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB
        });

        this.database.connect((err) => {
            if (err) {
                console.log(err);
                return;
            }
            console.log("Connected to my DB!");
        })

        return this; 
    }

    SelectAll(table, callback) {
        try {
            this.database.query(`SELECT * FROM ${table}`, (err, res, field) => {
                if (err) {
                    console.log(err);
                }
    
                console.log(res);
                return callback(res);
            })
    
        } catch (err) {
            console.log(err);
        }
    
    }

    SelectOne(table, id, callback){
        
    }
    
}





module.exports = Database; 





