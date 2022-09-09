*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary    locale=en_US
#https://faker.readthedocs.io/en/master/locales/en_US.html
Library           OperatingSystem
Library           String
Library           Libraries/geradorCelular/geradorCelular.py

*** Variables ***
${brownser}    firefox
${url}         http://automationpractice.com/
${Locator_Sign_In}     //a[@class='login'][contains(.,'Sign in')]
${EMAIL_LOGIN}        rmunoz@example.com
${SENHA_LOGIN}        sE(H1Eb7xD

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Gerar Celular
    ${CELULAR}    geradorCelular.Cell phone number

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
    Append To File                   ${EXECDIR}/myfiles/senha.txt    @{CADASTRO_FAKE}\n
    
Então um novo cadastro é criado
    Wait Until Page Contains Element    locator=//p[contains(.,'Welcome to your account. Here you can manage all of your personal information and orders.')]    timeout=10s 

##CN0002-Login com sucesso no Automation Practice
E clico em Sign in
    E o cliente deseja realizar um cadastro

Quando preencho o campo email
    Input Text    locator=//input[@id='email']    text=${EMAIL_LOGIN}

E preencho o campo senha
    Input Text    locator=//input[contains(@type,'password')]    text=${SENHA_LOGIN}

E clico no botão ${SIGN_IN_LOGIN} no login
    Click Button    locator=//button[@type='submit'][contains(.,'${SIGN_IN_LOGIN}')]

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}

##CN0003-Pesquisar roupas femininas com o menor valor
Dado que eu esteja realizando uma compra
    Dado que acesso o site automation practice

Quando o cliente pesquisar por menor valor
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//span[@class='cat-name'][contains(.,'Women')]
    Select From List By Value    id=selectProductSort    price:asc

Então será exibido apenas peças com o menor valor
    Sleep    2s
    Execute Javascript    window.scrollTo(0,1100)
    Sleep    3s

##CN0004-Compra com sucesso utilizando forma de pagamento ${FORMA_PAGAMENTO}
E realizo login
    Quando preencho o campo email
    E preencho o campo senha
    E clico no botão Sign in no login

E clico na opção Women
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//span[@class='cat-name'][contains(.,'Women')]    timeout=10s

Quando adicionar o produto ${PRODUTO} ao carrinho
    #Wait Until Element Is Visible    locator=//img[contains(@title,'${PRODUTO}')]    timeout=5s
    Click Element    locator=//a[@class='product-name'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Faded Short Sleeve T-shirts')]    timeout=10s
    Click Element    locator=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    locator=//h2[contains(.,'Product successfully added to your shopping cart')]    timeout=10s
    Click Element    locator=//span[contains(@class,'cross')]

E adicionar o produto ${PRODUTO} no carrinho
    Click Element    locator=//a[contains(@class,'home')]
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//img[contains(@title,'${PRODUTO}')]    timeout=10s
    Click Element    locator=//a[@class='product-name'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'${PRODUTO}')]
    Click Element    locator=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    locator=//h2[contains(.,'Product successfully added to your shopping cart')]    timeout=10s
    Click Element    locator=//span[contains(.,'Proceed to checkout')]

E realizo os proximos passos da venda com pagamento ${FORMA_PAGAMENTO}
    Wait Until Element Is Visible    locator=//span[contains(.,'01. Summary')]    timeout=10s
    Click Element    locator=//a[@class='button btn btn-default standard-checkout button-medium']
    Wait Until Element Is Visible    locator=//span[contains(.,'03. Address')]    timeout=10s
    Click Element    locator=//button[@type='submit'][contains(.,'Proceed to checkout')]
    Wait Until Element Is Visible    locator=//span[contains(.,'04. Shipping')]    timeout=10s
    Select Checkbox    locator=//input[contains(@type,'checkbox')]
    Click Element    locator=//button[@type='submit'][contains(.,'Proceed to checkout')]
    Wait Until Element Is Visible    locator=//span[contains(.,'05. Payment')]    timeout=10s
    Click Element    locator=//a[@class='bankwire'][contains(.,'${FORMA_PAGAMENTO} (order processing will be longer)')]

Então a mensagem ${MSG_PAG_SUCESSO} é exibida após concluir compra
    Wait Until Element Is Visible    locator=//h3[contains(.,'Bank-wire payment.')]    timeout=10s
    Click Element    locator=//span[contains(.,'I confirm my order')]
    Wait Until Element Is Visible    locator=//strong[@class='dark'][contains(.,'${MSG_PAG_SUCESSO}.')]    timeout=10s