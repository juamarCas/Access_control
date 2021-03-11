# DataBase
Important Note: Using docker is not necessary, use another host of your needs.</br>

This dockerfile creates a image with MySQL version 5.7.</br>
## Database design 

MySQL is the database used to store information and it follows this simplified design: </br>
![all text](../images/DatabaseModel.png "Database model")

## Tables
Important note:  the tables _mqtt\_user_ and _mqtt\_acl_ are for the EMQX MySQL access control plugin, if you are not using EMQX or the MySQL EQMX plugin, please skip those tables. For more information go to their [Documentation](https://docs.emqx.io/en/broker/latest/advanced/acl-mysql.html#mysql-connection-information "MySql access control plugin documentation").</br>
