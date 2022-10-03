*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${AUTH_FIELD_EMAIL}              //input[@id='email']
${AUTH_BTN_CREATE_AN_ACCOUNT}    id:SubmitCreate
${AUTH_SUBHEADING_YOURADDRESS}   'Create an account'
${AUTH_LOGIN_EMAIL}              rmunoz@example.com
${AUTH_LOGIN_SENHA}              sE(H1Eb7xD
${AUTH_FIELD_LOGIN_EMAIL}        name:email
${AUTH_FIELD_LOGIN_SENHA}        id:passwd
${AUTH_BTN_SUBMIT_LOGIN}         id:SubmitLogin

*** Keywords ***
Quando preencher o campo email
    ${EMAIL_FAKE}                   FakerLibrary.Email
    Set Global Variable             ${EMAIL_FAKE}
    Input Text                      ${AUTH_FIELD_EMAIL}    text=${EMAIL_FAKE}

E clicar em Create an account
    Click Button                     ${AUTH_BTN_CREATE_AN_ACCOUNT}
    Wait Until Element Is Visible    xpath://h1[@class='page-heading'][contains(.,${AUTH_SUBHEADING_YOURADDRESS})]    timeout=15s

Quando preencho o campo email no login
    Input Text    ${AUTH_FIELD_LOGIN_EMAIL}      text=${AUTH_LOGIN_EMAIL}

E preencho o campo senha
    Input Text    ${AUTH_FIELD_LOGIN_SENHA}      text=${AUTH_LOGIN_SENHA}

E clico no botão Sign in no login
    Click Button    ${AUTH_BTN_SUBMIT_LOGIN} 

E realizo login
    Quando preencho o campo email no login
    E preencho o campo senha
    E clico no botão Sign in no login