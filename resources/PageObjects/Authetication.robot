*** Settings ***
Library    SeleniumLibrary
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html

*** Variables ***
${AUTH_FIELD_EMAIL}    @id,'create'
${AUTH_BTN_CREATE_AN_ACCOUNT}    'Create an account'

*** Keywords ***
Quando preencher o campo email
    ${EMAIL_FAKE}                    FakerLibrary.Email
    Input Text                       locator=//input[@type='text'][contains(${AUTH_FIELD_EMAIL})]    text=${EMAIL_FAKE}

E clicar em Create an account
    Click Button                     locator=//button[@class='btn btn-default button button-medium exclusive'][contains(.,${AUTH_BTN_CREATE_AN_ACCOUNT})]
