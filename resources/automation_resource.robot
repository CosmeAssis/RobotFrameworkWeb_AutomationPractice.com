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

Então a mensagem ${MSG_PAG_SUCESSO} é exibida após concluir compra
    Wait Until Element Is Visible    locator=//h3[contains(.,'Bank-wire payment.')]    timeout=10s
    Click Element    locator=//span[contains(.,'I confirm my order')]
    Wait Until Element Is Visible    locator=//strong[@class='dark'][contains(.,'${MSG_PAG_SUCESSO}.')]    timeout=10s