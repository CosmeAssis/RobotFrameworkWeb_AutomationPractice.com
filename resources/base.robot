*** Settings ***
Resource    ../libraries/libraries.robot

*** Variables ***
${brownser}           chrome

*** Keywords ***
Abrir o navegador
    Open Browser   brownser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser