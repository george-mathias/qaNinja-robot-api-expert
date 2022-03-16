*** Settings ***
Documentation        Database helpers connection

Library          RobotMongoDBLibrary.Delete
Library          RobotMongoDBLibrary.Find

*** Variables ***
&{MONGO_URI}     connection=mongodb+srv://bugereats:bugerEats@cluster0.zhrbt.mongodb.net/PartnerDB?retryWrites=true&w=majority    database=PartnerDB   collection=partner