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