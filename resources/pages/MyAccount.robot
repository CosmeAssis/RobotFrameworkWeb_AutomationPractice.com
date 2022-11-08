*** Settings ***
Resource    ../base.robot

*** Variables ***
${MYACCT_MSG_CREATE_ACCOUNT}    'Welcome to your account. Here you can manage all of your personal information and orders.'

*** Keywords ***
Então um novo cadastro é criado
    Wait Until Page Contains Element    xpath=//p[contains(.,${MYACCT_MSG_CREATE_ACCOUNT})]    timeout=10s 