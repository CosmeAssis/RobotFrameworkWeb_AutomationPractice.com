*** Settings ***
Library    SeleniumLibrary
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html
Library           ./Libraries/geradorCelular/geradorCelular.py
Library           OperatingSystem

*** Variables ***
${AUTH_FIELD_EMAIL}    @id,'create'

*** Keywords ***
Quando preencher o campo email
    ${EMAIL_FAKE}                    FakerLibrary.Email
    Input Text                       locator=//input[@type='text'][contains(${AUTH_FIELD_EMAIL})]    text=${EMAIL_FAKE}

E clicar em Create an account
    Click Button                     locator=//button[@class='btn btn-default button button-medium exclusive'][contains(.,'Create an account')]
