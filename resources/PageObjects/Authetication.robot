*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html

*** Variables ***
${AUTH_FIELD_EMAIL}              id:email_create
${AUTH_BTN_CREATE_AN_ACCOUNT}    id:SubmitCreate
${AUTH_SUBHEADING_YOURADDRESS}   'Create an account'

*** Keywords ***
Quando preencher o campo email
    ${EMAIL_FAKE}                   FakerLibrary.Email
    Set Global Variable             ${EMAIL_FAKE}
    Input Text                      ${AUTH_FIELD_EMAIL}    text=${EMAIL_FAKE}

E clicar em Create an account
    Click Button                     ${AUTH_BTN_CREATE_AN_ACCOUNT}
    Wait Until Element Is Visible    xpath://h1[@class='page-heading'][contains(.,${AUTH_SUBHEADING_YOURADDRESS})]    timeout=15s