*** Settings ***
Documentation    POST /partners

Resource         ${EXECDIR}/resources/base.robot

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

    ${response}   POST    ${BASE_URL}${/PARTNERS}
    ...           json=${payload}
    ...           headers=${headers}

    Status Should Be    201

    Log To Console   Response: ${response}
    Log To Console   ResponseBody: ${response.json()}
    Log To Console   ResponseBody: ${response.json()}[partner_id]
    
    ${results}    Find    ${MONGO_URI}    ${filter}
    Log To Console     Results: ${results}[0]
    
    Should Be Equal    ${response.json()}[partner_id]    ${results}[0][_id]