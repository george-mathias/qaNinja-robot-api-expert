*** Settings ***
Documentation        services layer

Library          RequestsLibrary

*** Variables ***
${BASE_URL}       http://localhost:3333
${/PARTNERS}      /partners
&{HEADERS}       Content-Type=application/json    auth_user=qa    auth_password=ninja

*** Keywords ***
POST Partner
    [Arguments]   ${payload}

    ${response}   POST    ${BASE_URL}${/PARTNERS}
    ...           json=${payload}
    ...           headers=${HEADERS}
    ...           expected_status=any

    [return]      ${response}

GET Partners
    ${response}   GET    ${BASE_URL}${/PARTNERS}
    ...           headers=${HEADERS}
    ...           expected_status=any

    [return]      ${response}
Search partner
    [Arguments]    ${name}

    ${query}    Create Dictionary    name=${name}

    ${response}   GET    ${BASE_URL}${/PARTNERS}
    ...           params=${query}
    ...           headers=${HEADERS}
    ...           expected_status=any

    [return]      ${response}

Enable Partner
    [Arguments]   ${partner_id}

    ${response}   PUT    ${BASE_URL}${/PARTNERS}/${partner_id}/enable
    ...           headers=${HEADERS}
    ...           expected_status=any

    [return]      ${response}