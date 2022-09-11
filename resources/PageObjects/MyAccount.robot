*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Então um novo cadastro é criado
    Wait Until Page Contains Element    locator=//p[contains(.,'Welcome to your account. Here you can manage all of your personal information and orders.')]    timeout=10s 