*** Settings ***
Documentation        Aqui tudo começa

Library         factories/partner.py

Resource        database.robot
Resource        services.robot
Resource        helpers.robot
Resource        rabbitmq.robot