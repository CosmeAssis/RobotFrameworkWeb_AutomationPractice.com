*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary
Library           OperatingSystem
Library           String

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

##CN0001-Criação de novo cadastro no site
Dado que acesso o site automation practice
    Go To    url=${url}

E o cliente deseja realizar um cadastro
    Click Element    locator=${Locator_Sign_In}
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Authentication')]    timeout=20s

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
    ${CELULAR}                       Evaluate   random.randint(11999510000,11999519999)    random
    ${CELULAR}                       Convert To Integer    ${CELULAR}
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
    Append To File                   ${EXECDIR}/senha.txt    @{CADASTRO_FAKE}\n
    
Então um novo cadastro é criado
    Wait Until Page Contains Element    locator=//p[contains(.,'Welcome to your account. Here you can manage all of your personal information and orders.')]    timeout=10s 

##CN0002-Login com sucesso no Automation Practice
E clico em Sign In
    E o cliente deseja realizar um cadastro

Quando preencho o campo email
    Input Text    locator=//input[@id='email']    text=rmunoz@example.com

#E preencho o campo senha
#E clico no botão Sign In
#Então sou direcionado para a pagina com titulo My account - My Store