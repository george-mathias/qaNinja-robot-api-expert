*** Settings ***
Documentation    POST /partners

Library          RequestsLibrary

*** Variables ***
${BASE_URL}      http://localhost:3333
${ENDPOINT}      /partners

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

    ${response}   POST    ${BASE_URL}${ENDPOINT}
    ...           json=${payload}
    ...           headers=${headers}

    Status Should Be    201