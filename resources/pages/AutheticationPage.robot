*** Settings ***
Resource    ../base.robot
Variables    ../Maps/AutheticationMaps.py
Variables    ../TestData/TestData.py

*** Keywords ***
Quando preencher o campo email
    ${EmailFake}                    FakerLibrary.Email
    Set Global Variable             ${EmailFake}
    Input Text                      ${AuthEmailInput}    ${EmailFake}

E clicar em Create an account
    Click Button                     ${AuthBtnCreateAccount}
    Wait Until Element Is Visible    ${AuthShYourAddress}    timeout=15s

Quando preencho o campo email no login
    Wait Until Element Is Visible    ${AuthElementEmail}
    Input Text    ${AuthLoginEmailInput}     ${Username} 

E preencho o campo senha
    Input Text    ${AuthLoginPassInput}      ${Password}

E clico no botão Sign in no login
    Click Button    ${AuthBtnSubmitLogin} 

E realizo login
    Quando preencho o campo email no login
    E preencho o campo senha
    E clico no botão Sign in no login