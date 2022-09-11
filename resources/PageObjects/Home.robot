*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}         http://automationpractice.com/

*** Keywords ***
Dado que acesso o site automation practice
    Go To    url=${url}

E o cliente deseja realizar um cadastro
    Click Element    locator=//a[@class='login'][contains(.,'Sign in')]
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'Authentication')]    timeout=20s

E clico em Sign in
    E o cliente deseja realizar um cadastro

Dado que eu esteja realizando uma compra
    Dado que acesso o site automation practice