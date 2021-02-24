const mysql = require('mysql');

require('dotenv').config()

const database = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB
});

database.connect((err) => {
    if (err) {
        console.log(err);
        return;
    }
    console.log("Connected to my DB!");
})

function SelectAll(table, callback) {
    try {
        database.query(`SELECT * FROM ${table}`, (err, res, field) => {
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

module.exports = {
    database,
    SelectAll
}



