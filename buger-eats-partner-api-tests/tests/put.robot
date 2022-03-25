*** Settings ***
Documentation    PUT /partners

Resource         ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should enable a partner

    ${partner}        Factory Enable Partner
    Remove Partner By Name    ${partner}[name]

    ${response}       Post Partner    ${partner}
    ${partner_id}     Set Variable    ${response.json()}[partner_id]
    Log To Console    \npartner_id: ${partner_id}

    ${response}           Enable Partner    ${partner_id}
    Status Should Be      200

Should return 404 on try enable a deleted partner
    [Tags]    404

    ${partner}        Factory 404 Partner
    Remove Partner By Name    ${partner}[name]

    ${response}       Post Partner    ${partner}
    ${partner_id}     Set Variable    ${response.json()}[partner_id]
    Remove Partner By Name    ${partner}[name]

    ${response}           Enable Partner    ${partner_id}
    Status Should Be      404