*** Settings ***
Library           SeleniumLibrary
Library           String


*** Variables ***
${brownser}           headlesschrome

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

##CN0002-Login com sucesso no Automation Practice
Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}

##CN0004-Compra com sucesso utilizando forma de pagamento ${FORMA_PAGAMENTO}
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