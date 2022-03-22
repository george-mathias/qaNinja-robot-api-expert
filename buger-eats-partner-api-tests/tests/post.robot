*** Settings ***
Documentation    POST /partners

Resource         ${EXECDIR}/resources/base.robot
Resource    ../resources/services.robot

*** Test Cases ***
Should create a new partner
    
    ${payload}    Create Dictionary
    ...           name=Pizzas Papito's
    ...           email=contato@papitos.com.br
    ...           whatsapp=11999999999
    ...           business=Restaurante

    Remove Partner By Name    Pizzas Papito's

    ${response}    POST Partner    ${payload}

    Status Should Be    201

    Log To Console   Response: ${response}
    Log To Console   ResponseBody: ${response.json()}
    Log To Console   ResponseBodyPartner: ${response.json()}[partner_id]
    
    ${result}      Find Partner by Name     Pizzas Papito's
    Log To Console     Results: ${result}
    
    Should Be Equal    ${response.json()}[partner_id]    ${result}[_id]