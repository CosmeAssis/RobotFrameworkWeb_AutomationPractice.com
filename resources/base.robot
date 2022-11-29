*** Settings ***
Resource    ../libraries/libraries.robot

*** Variables ***
${browser}           googlechrome

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${browser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser