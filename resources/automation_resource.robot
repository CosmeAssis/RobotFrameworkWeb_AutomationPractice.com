*** Settings ***
Library           SeleniumLibrary
Library           String


*** Variables ***
${brownser}    firefox
${EMAIL_LOGIN}        rmunoz@example.com
${SENHA_LOGIN}        sE(H1Eb7xD

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

##CN0002-Login com sucesso no Automation Practice
Quando preencho o campo email
    Input Text    locator=//input[@id='email']    text=${EMAIL_LOGIN}

E preencho o campo senha
    Input Text    locator=//input[contains(@type,'password')]    text=${SENHA_LOGIN}

E clico no botão ${SIGN_IN_LOGIN} no login
    Click Button    locator=//button[@type='submit'][contains(.,'${SIGN_IN_LOGIN}')]

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}

##CN0003-Pesquisar roupas femininas com o menor valor

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