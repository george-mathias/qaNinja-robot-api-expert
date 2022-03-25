*** Settings ***
Documentation    POST /partners

Resource         ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should create a new partner
    
    ${partner}    Factory New Partner

    Remove Partner By Name    ${partner}[name]

    ${response}    POST Partner    ${partner}

    Status Should Be    201

    Log To Console   \nResponse: ${response}
    Log To Console   \nResponseBody: ${response.json()}
    Log To Console   \nResponseBodyPartner: ${response.json()}[partner_id]
    
    ${result}      Find Partner by Name     ${partner}[name]
    Log To Console     Results: ${result}
    
    Should Be Equal    ${response.json()}[partner_id]    ${result}[_id]

Should return duplicate company name
    [Tags]    bugs
    ${partner}    Factory Duplicate Name

    Create a new partner    ${partner}

    ${response}    POST Partner    ${partner}
    Status Should Be    409

    Log To Console    \nResponse: ${response.json()}

    Should Be Equal    ${response.json()}[message]    Duplicate company name