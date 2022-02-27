*** Settings ***
Documentation    POST /partners

Library          RequestsLibrary
Library          RobotMongoDBLibrary.Delete
Library          RobotMongoDBLibrary.Find

*** Variables ***
${BASE_URL}      http://localhost:3333
${ENDPOINT}      /partners
&{MONGO_URI}     connection=mongodb+srv://bugereats:bugerEats@cluster0.zhrbt.mongodb.net/PartnerDB?retryWrites=true&w=majority    database=PartnerDB   collection=partner

*** Test Cases ***
Should create a new partner
    
    ${payload}    Create Dictionary
    ...           name=Pizzas Papito's
    ...           email=contato@papitos.com.br
    ...           whatsapp=11999999999
    ...           business=Restaurante

    ${headers}    Create Dictionary
    ...           Content-Type=application/json
    ...           auth_user=qa
    ...           auth_password=ninja

    ${filter}     Create Dictionary
    ...           name=Pizzas Papito's

    Delete One    ${MONGO_URI}    ${filter}

    ${response}   POST    ${BASE_URL}${ENDPOINT}
    ...           json=${payload}
    ...           headers=${headers}

    Status Should Be    201
    
    ${results}    Find    ${MONGO_URI}    ${filter}
    
    Should Be Equal    ${response.json()}[partner_id]    ${results}[0][_id]