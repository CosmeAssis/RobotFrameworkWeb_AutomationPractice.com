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
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Create an account')]    timeout=15s
    Select Radio Button              id_gender    1
    Input Text                       locator=//input[@name='customer_firstname']    text=${FIRST_NAME_FAKE}
    Input Text                       locator=//input[contains(@name,'customer_lastname')]    text=${LAST_NAME_FAKE}
    Input Text                       locator=//input[contains(@type,'password')]    text=${PASSWORD_FAKE}
    Click Element			         id=days
    Select From List By Index	     id=days  ${DIA_NASCIMENTO_FAKE}
    Click Element			         id=months
    Select From List By Index	     id=months  ${MES_NASCIMENTO_FAKE}
    Click Element			         id=years
    Select From List By Value	     id=years  ${ANO_NASCIMENTO_FAKE}
    Input Text                       locator=//input[@name='firstname']         text=${FIRST_NAME_FAKE}
    Input Text                       locator=//input[@name='lastname']          text=${LAST_NAME_FAKE}
    Input Text                       locator=//input[@name='address1']          text=${ENDERECO_FAKE}
    Input Text                       locator=//input[contains(@name,'city')]    text=${CIDADE_FAKE}
    Select From List By Value	     id=id_state    ${ran int}
    Input Text                       locator=//input[contains(@class,'form-control uniform-input text')]    text=${POSTAL_CODE}
    Input Text                       locator=//input[@type='text'][contains(@id,'mobile')]    text=${CELULAR}
    Click Element                    locator=//span[contains(.,'Register')]
    Capture Page Screenshot
    @{CADASTRO_FAKE}                 Create List    Email:${EMAIL_FAKE} - Password:${PASSWORD_FAKE}
    Append To File                   ${EXECDIR}/myfiles/senha.txt    @{CADASTRO_FAKE}\n
