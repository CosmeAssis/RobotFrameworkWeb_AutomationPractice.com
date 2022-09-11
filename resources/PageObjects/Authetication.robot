*** Settings ***
Library    SeleniumLibrary
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html
Library           ./Libraries/geradorCelular/geradorCelular.py
Library           OperatingSystem

*** Keywords ***
Quando entrar com as informações de cadastro
    ${EMAIL_FAKE}                    FakerLibrary.Email
    ${FIRST_NAME_FAKE}               FakerLibrary.First Name
    ${LAST_NAME_FAKE}                FakerLibrary.Last Name
    ${PASSWORD_FAKE}                 FakerLibrary.Password
    ${DIA_NASCIMENTO_FAKE}           FakerLibrary.Day Of Month
    ${MES_NASCIMENTO_FAKE}           FakerLibrary.Month
    ${ANO_NASCIMENTO_FAKE}           FakerLibrary.Year
    ${ENDERECO_FAKE}                 FakerLibrary.Address
    ${CIDADE_FAKE}                   FakerLibrary.City
    ${ran int}                       Evaluate    random.randint(1, 50)    random
    ${ran int}                       Convert To Integer    ${ran int}
    ${POSTAL_CODE}                   FakerLibrary.Postalcode
    ${CELULAR}                       geradorCelular.Phn
    Input Text                       locator=//input[@type='text'][contains(@id,'create')]    text=${EMAIL_FAKE}
    Click Button                     locator=//button[@class='btn btn-default button button-medium exclusive'][contains(.,'Create an account')]
