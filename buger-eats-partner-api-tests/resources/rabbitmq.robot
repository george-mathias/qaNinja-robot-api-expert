*** Settings ***
Documentation        RabbitMQ Helpers API

*** Variables ***
${RABBIT_URL}        https://chimpanzee.rmq.cloudamqp.com/api/queues/sjzgyjky/email
&{RABBIT_HEADERS}    Content-Type=application/json    Authorization=Basic c2p6Z3lqa3k6c1c4Mi00ejV3bkw1ZUdfQUs0VjFWZnIxNDIzMmdld1Q=

*** Keywords ***
Purge Messages

    ${payload}        Create Dictionary
    ...               vhost=sjzgyjky
    ...               name=email
    ...               mode=purge
   
    ${response}       DELETE    ${RABBIT_URL}/contents
    ...               json=${payload}
    ...               headers=&{RABBIT_HEADERS}

    [Return]          ${response}

Get Message

    ${payload}        Create Dictionary
    ...               vhost=sjzgyjky
    ...               name=email
    ...               truncate=50000
    ...               ackmode=ack_requeue_true
    ...               encoding=auto
    ...               count=1

    ${response}       POST    ${RABBIT_URL}/get
    ...               json=${payload}
    ...               headers=&{RABBIT_HEADERS}

    [Return]          ${response.json()}[0]