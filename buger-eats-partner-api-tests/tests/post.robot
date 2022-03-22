*** Settings ***
Documentation    POST /partners

Resource         ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should create a new partner
    
    ${partner}    Factory New Partner

    Remove Partner By Name    ${partner}[name]

    ${response}    POST Partner    ${partner}

    Status Should Be    201

    Log To Console   Response: ${response}
    Log To Console   ResponseBody: ${response.json()}
    Log To Console   ResponseBodyPartner: ${response.json()}[partner_id]
    
    ${result}      Find Partner by Name     ${partner}[name]
    Log To Console     Results: ${result}
    
    Should Be Equal    ${response.json()}[partner_id]    ${result}[_id]