*** Settings ***
Documentation    PUT /partners

Resource         ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should enable a partner

    ${partner}        Factory Enable Partner
    
    ${partner_id}     Create a new partner    ${partner}

    ${response}           Enable Partner    ${partner_id}
    Status Should Be      200

Should disable a partner
    [Tags]    disPart
    ${partner}        Factory Disable Partner
    
    ${partner_id}     Create a new partner    ${partner}
    Enable Partner    ${partner_id}

    ${response}           Disable Partner    ${partner_id}
    Status Should Be      200

Should return 404 on try enable a unregistered partner
    [Tags]    404

    ${partner}        Factory 404 Partner
    
    ${partner_id}     Create a new partner    ${partner}
    Remove Partner By Name    ${partner}[name]

    ${response}           Enable Partner    ${partner_id}
    Status Should Be      404

Should return 404 on try disable a unregistered partner
    [Tags]    404

    ${partner}        Factory 404 Partner
    
    ${partner_id}     Create a new partner    ${partner}
    Remove Partner By Name    ${partner}[name]

    ${response}           Disable Partner    ${partner_id}
    Status Should Be      404