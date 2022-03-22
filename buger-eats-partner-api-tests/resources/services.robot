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