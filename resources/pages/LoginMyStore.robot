*** Settings ***
Resource    ../base.robot
Resource          Authetication.robot

*** Variables ***
${LOGIN_FIELD_FIRSTNAME}            id:customer_firstname
${LOGIN_FIELD_LASTNAME}             id:customer_lastname
${LOGIN_FIELD_PASSWORD}             id:passwd
${LOGIN_FIELD_ADDRESS_FIRSTNAME}    id:firstname
${LOGIN_FIELD_ADDRESS_LASTNAME}     id:lastname
${LOGIN_FILED_ADDRESS}              id:address1
${LOGIN_FILED_ADDRESS_CITY}         id:city
${LOGIN_FIELD_ADDRESS_POSTALCODE}   id:postcode
${LOGIN_FIELD_ADDRESS_PHONE}        id:phone_mobile
${LOGIN_BTN_REGISTER}               id:submitAccount
${LOGIN_SLTC_DAYS}                  id:days
${LOGIN_SLTC_MONTHS}                id:months
${LOGIN_SLTC_YEARS}                 id:years
${LOGIN_SLTC_STATE}                 id:id_state

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
    ${ran_int}                       Evaluate    random.randint(1, 50)    random
    ${ran_int}                       Convert To Integer    ${ran_int}
    ${POSTAL_CODE}                   FakerLibrary.Postalcode
    ${PHONE}                         geradorCelular.Phn
    Select Radio Button              id_gender    1
    Input Text                       ${LOGIN_FIELD_FIRSTNAME}    text=${FIRST_NAME_FAKE}
    Input Text                       ${LOGIN_FIELD_LASTNAME}    text=${LAST_NAME_FAKE}
    Input Text                       ${LOGIN_FIELD_PASSWORD}  text=${PASSWORD_FAKE}
    Select From List By Index	     ${LOGIN_SLTC_DAYS}  ${DIA_NASCIMENTO_FAKE}
    Select From List By Index	     ${LOGIN_SLTC_MONTHS}  ${MES_NASCIMENTO_FAKE}
    Select From List By Value	     ${LOGIN_SLTC_YEARS}  ${ANO_NASCIMENTO_FAKE}
    Input Text                       ${LOGIN_FIELD_ADDRESS_FIRSTNAME}         text=${FIRST_NAME_FAKE}
    Input Text                       ${LOGIN_FIELD_ADDRESS_LASTNAME}         text=${LAST_NAME_FAKE}
    Input Text                       ${LOGIN_FILED_ADDRESS}          text=${ENDERECO_FAKE}
    Input Text                       ${LOGIN_FILED_ADDRESS_CITY}    text=${CIDADE_FAKE}
    Select From List By Value	     ${LOGIN_SLTC_STATE}    ${ran_int}
    Input Text                       ${LOGIN_FIELD_ADDRESS_POSTALCODE}    text=${POSTAL_CODE}
    Input Text                       ${LOGIN_FIELD_ADDRESS_PHONE}    text=${PHONE}
    Click Element                    ${LOGIN_BTN_REGISTER}
    Capture Page Screenshot
    @{CADASTRO_FAKE}                 Create List    Email:    ${EMAIL_FAKE} - Password:${PASSWORD_FAKE}
    Append To File                   ${EXECDIR}/myfiles/senha.txt    @{CADASTRO_FAKE}\n