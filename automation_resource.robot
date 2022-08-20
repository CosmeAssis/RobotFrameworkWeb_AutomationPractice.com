*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary
Library           OperatingSystem

*** Variables ***
${brownser}    firefox
${url}         http://automationpractice.com/
${Locator_Sign_In}     //a[@class='login'][contains(.,'Sign in')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

*** Keywords ***

##CN0001-Criação de novo cadastro no site
Dado que acesso o site automation practice
    Go To    url=${url}

E o cliente deseja realizar um cadastro
    Click Element    locator=${Locator_Sign_In}
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Authentication')]

Quando entrar com as informações de cadastro
    ${EMAIL_FAKE}                    FakerLibrary.Email
    ${FIRST_NAME_FAKE}               FakerLibrary.First Name
    ${LAST_NAME_FAKE}                FakerLibrary.Last Name
    ${PASSWORD_FAKE}                 FakerLibrary.Password
    Input Text                       locator=//input[@type='text'][contains(@id,'create')]    text=${EMAIL_FAKE}
    Click Button                     locator=//button[@class='btn btn-default button button-medium exclusive'][contains(.,'Create an account')]
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Create an account')]
    Input Text                       locator=//input[@name='customer_firstname']    text=${FIRST_NAME_FAKE}
    Input Text                       locator=//input[contains(@name,'customer_lastname')]    text=${LAST_NAME_FAKE}
    Input Text                       locator=//input[contains(@type,'password')]    text=${PASSWORD_FAKE}
    Capture Page Screenshot
    @{CADASTRO_FAKE}                 Create List    "Email:${EMAIL_FAKE} - Password:${PASSWORD_FAKE}"
    Append To File                   ${EXECDIR}/senha.txt    @{CADASTRO_FAKE}\n
    
#Então um novo cadastro é criado