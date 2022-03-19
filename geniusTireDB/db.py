import mysql.connector #Importing Connector package


def setUp():
    mysqldb=mysql.connector.connect(host="localhost",user="root",password="")#established connection
    mycursor=mysqldb.cursor()#cursor() method create a cursor object
    mycursor.execute("CREATE DATABASE IF NOT EXISTS geniusTire")  # Execute SQL Query to create a database
    # mycursor = mysqldb.cursor()  # cursor() method create a cursor object
    mycursor.execute("USE geniusTire")  # Execute SQL Query to create a table into your database
    mycursor.execute("CREATE TABLE IF NOT EXISTS User_tbl (user_id INT NOT NULL AUTO_INCREMENT,user_name varchar(45) NOT NULL,user_email varchar(45) NOT NULL,user_password varchar(255) NOT NULL,PRIMARY KEY (user_id));")  # Execute SQL Query to create a table into your database
    mycursor.execute("CREATE TABLE IF NOT EXISTS Password_tbl (user_id INT NOT NULL ,platform varchar(45) NOT NULL,user_password varchar(255) NOT NULL , FOREIGN KEY (user_id) REFERENCES User_tbl(user_id))")  # Execute SQL Query to create a table into your database

    # mysqldb.close()  # Connection Close
    mysqldb.close()