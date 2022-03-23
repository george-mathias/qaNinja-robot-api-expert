*** Settings ***
Documentation    GET /partners

Resource         ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should return a partner list

    ${partners}    Factory Partner List

    FOR  ${partner}  IN  @{partners}
        POST Partner    ${partner}
    END

    ${response}    GET Partners
    Status Should Be    200

    Log To Console    response: ${response.json()}

    ${size}    Get Length    ${response.json()}
    Log To Console    response lenght: ${size}
    Should Be True           ${size} > 0


    