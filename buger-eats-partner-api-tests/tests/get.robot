*** Settings ***
Documentation    GET /partners

Resource         ${EXECDIR}/resources/base.robot

Suite Setup      Create a partner list

*** Test Cases ***
Should return a partner list

    ${response}    GET Partners
    Status Should Be    200

    Log To Console    response: ${response.json()}

    ${size}    Get Length    ${response.json()}
    Log To Console    response lenght: ${size}
    Should Be True           ${size} > 0

Should search partner by name
    
    ${response}    Search Partner    mary jane
    Status Should Be    200
    

*** Keywords ***
Create a partner list
    ${partners}    Factory Partner List

    FOR  ${partner}  IN  @{partners}
         POST Partner    ${partner}
    END
