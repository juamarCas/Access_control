const mysql = require('mysql');

require('dotenv').config()

class Database {
    static instance;
    database;
    constructor() {
        //Singleton 
        if (!!Database.instance) {
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
                throw err;
            }
            console.log("Connected to my DB!");
        })

        return this;
    }

    SelectAll(table, callback) {
        try {
            this.database.query(`SELECT * FROM ${table}`, (err, res, field) => {
                if (err) {
                    throw err;
                }

                console.log(res);
                return callback(res);
            })

        } catch (err) {
            console.log(err);
        }

    }

    SelectOne(table, column, value, callback) {
        try {
            this.database.query(`SELECT * FROM ${table} WHERE ${column} = \'${value}\'`,
                (err, res, field) => {
                    if (err) {
                        console.log(err);
                        return;
                    }

                    console.log(res);
                    return callback(res);
                })
        } catch (err) {
            console.log(err);
        }
    }

    ///<summar>
    ///Updates a column in a table
    ///<param name="table">Table where is the column you want to update</param>
    ///<param name="column">Column you want to update</param>
    ///<param name="newVal">New value of the column</param>
    ///<param name="conColumn">Conditional column</param>
    ///<param name="cond">Conditional value</param>
    ///<param name="callback">function you want to call</param>
    ///</summary>
    UpdateOne(table, column, newVal, conCol, cond, callback){
        try{
            this.database.query(`UPDATE ${table} SET ${column} = ${newVal} WHERE ${conCol} = \'${cond}\'`, 
            (err, res, field)=>{
                if(err){
                    throw err;
                }

                callback("operation went succesfully"); 
            })
        }catch(err){
            console.log(err); 
            return; 
        }
    }

    ///<summary>
    ///Runs a custom query
    ///<param name="q">the query you want to do</param>
    ///<param name="callback">function you want to execute after the query is completed</param>
    ///<param name="values">Array of values of your query</param>
    ///</summary>
    Query(q, values, callback) {
        try {
            this.database.query(q, values, (err, res, field) => {
                if (err) {
                    throw err;
                }

                return callback(res);
            })
        } catch (err) {
            console.log(err);
        }
    }
}





module.exports = Database;





