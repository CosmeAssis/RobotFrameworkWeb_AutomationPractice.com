*** Settings ***
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html
Library           SeleniumLibrary
Library           ./Libraries/geradorCelular/geradorCelular.py
Library           OperatingSystem
Resource          Authetication.robot

*** Variables ***
${C_ACCT_FIELD_FIRSTNAME}            'customer_firstname' 
${C_ACCT_FIELD_LASTNAME}             'customer_lastname'
${C_ACCT_FIELD_PASSWORD}             'password'
${C_ACCT_FIELD_ADDRESS_FIRSTNAME}    'firstname'
${C_ACCT_FIELD_ADDRESS_LASTNAME}     'lastname'
${C_ACCT_FILED_ADDRESS}              'address1'
${C_ACCT_FILED_ADDRESS_CITY}         'city'
${C_ACCT_FIELD_ADDRESS_POSTALCODE}   'postcode'
${C_ACCT_FIELD_ADDRESS_PHONE}        'phone'
${C_ACCT_BTN_REGISTER}               'Register'

*** Keywords ***
E entrar com as informações de cadastro
    ${FIRST_NAME_FAKE}               FakerLibrary.First Name
    ${LAST_NAME_FAKE}                FakerLibrary.Last Name
    ${PASSWORD_FAKE}                 FakerLibrary.Password
    Set Global Variable              ${PASSWORD_FAKE}
    ${DIA_NASCIMENTO_FAKE}           FakerLibrary.Day Of Month
    ${MES_NASCIMENTO_FAKE}           FakerLibrary.Month
    ${ANO_NASCIMENTO_FAKE}           FakerLibrary.Year
    ${ENDERECO_FAKE}                 FakerLibrary.Street Name
    ${CIDADE_FAKE}                   FakerLibrary.City
    ${ran int}                       Evaluate    random.randint(1, 50)    random
    ${ran int}                       Convert To Integer    ${ran int}
    ${POSTAL_CODE}                   FakerLibrary.Postalcode
    ${PHONE}                         geradorCelular.Phn
    Select Radio Button              id_gender    1
    Input Text                       id:customer_firstname    text=${FIRST_NAME_FAKE}
    Input Text                       locator=//input[contains(@name,${C_ACCT_FIELD_LASTNAME})]    text=${LAST_NAME_FAKE}
    Input Text                       locator=//input[@type=${C_ACCT_FIELD_PASSWORD}]  text=${PASSWORD_FAKE}
    Click Element			         id=days
    Select From List By Index	     id=days  ${DIA_NASCIMENTO_FAKE}
    Click Element			         id=months
    Select From List By Index	     id=months  ${MES_NASCIMENTO_FAKE}
    Click Element			         id=years
    Select From List By Value	     id=years  ${ANO_NASCIMENTO_FAKE}
    Input Text                       locator=//input[@name=${C_ACCT_FIELD_ADDRESS_FIRSTNAME}]         text=${FIRST_NAME_FAKE}
    Input Text                       locator=//input[@name=${C_ACCT_FIELD_ADDRESS_LASTNAME}]          text=${LAST_NAME_FAKE}
    Input Text                       locator=//input[@name=${C_ACCT_FILED_ADDRESS}]          text=${ENDERECO_FAKE}
    Input Text                       locator=//input[@name=${C_ACCT_FILED_ADDRESS_CITY}]    text=${CIDADE_FAKE}
    Select From List By Value	     id=id_state    ${ran int}
    Input Text                       locator=//input[@name=${C_ACCT_FIELD_ADDRESS_POSTALCODE}]    text=${POSTAL_CODE}
    Input Text                       locator=//input[@name=${C_ACCT_FIELD_ADDRESS_PHONE}]    text=${PHONE}
    Click Element                    locator=//span[contains(.,${C_ACCT_BTN_REGISTER})]
    Capture Page Screenshot
    @{CADASTRO_FAKE}                 Create List    Email:    ${EMAIL_FAKE} - Password:${PASSWORD_FAKE}
    Append To File                   ${EXECDIR}/myfiles/senha.txt    @{CADASTRO_FAKE}\n
