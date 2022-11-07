*** Settings ***
Resource    ./LibrariesBase/Libraries.robot

*** Variables ***
${brownser}           headlesschrome

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
