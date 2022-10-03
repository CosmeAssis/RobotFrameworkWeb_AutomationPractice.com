*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${AUTH_FIELD_EMAIL}              id:email_create
${AUTH_BTN_CREATE_AN_ACCOUNT}    id:SubmitCreate
${AUTH_SUBHEADING_YOURADDRESS}   'Create an account'
${AUTH_FIELD_LOGIN_EMAIL}        rmunoz@example.com
${AUTH_FIELD_LOGIN_SENHA}        sE(H1Eb7xD

*** Keywords ***
Quando preencher o campo email
    ${EMAIL_FAKE}                   FakerLibrary.Email
    Set Global Variable             ${EMAIL_FAKE}
    Input Text                      ${AUTH_FIELD_EMAIL}    text=${EMAIL_FAKE}

E clicar em Create an account
    Click Button                     ${AUTH_BTN_CREATE_AN_ACCOUNT}
    Wait Until Element Is Visible    xpath://h1[@class='page-heading'][contains(.,${AUTH_SUBHEADING_YOURADDRESS})]    timeout=15s

Quando preencho o campo email
    Input Text    locator=//input[@id='email']    text=${AUTH_FIELD_LOGIN_EMAIL}

E preencho o campo senha
    Input Text    locator=//input[contains(@type,'password')]    text=${AUTH_FIELD_LOGIN_SENHA}

E clico no botão ${SIGN_IN_LOGIN} no login
    Click Button    locator=//button[@type='submit'][contains(.,'${SIGN_IN_LOGIN}')]