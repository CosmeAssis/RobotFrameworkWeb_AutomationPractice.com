*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary

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
    ${EMAIL_FAKE}    FakerLibrary.Email
    ${FIRST_NAME}    FakerLibrary.First Name
    ${LAST_NAME}     FakerLibrary.Last Name
    Input Text    locator=//input[@type='text'][contains(@id,'create')]    text=${EMAIL_FAKE}
    Click Button    locator=//button[@class='btn btn-default button button-medium exclusive'][contains(.,'Create an account')]
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Create an account')]
    Input Text    locator=//input[@name='customer_firstname']    text=${FIRST_NAME}
    Input Text    locator=//input[contains(@name,'customer_lastname')]    text=${LAST_NAME}
    Capture Page Screenshot
    
#Então um novo cadastro é criado