*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${url}         http://automationpractice.com/
${HOME_BTN_SIGNIN}    'login'


*** Keywords ***
Dado que acesso o site automation practice
    Go To    url=${url}

E o cliente deseja realizar um cadastro
    Click Element    xpath=//a[contains(@class,${HOME_BTN_SIGNIN})]

E clico em Sign in
    E o cliente deseja realizar um cadastro

Dado que eu esteja realizando uma compra
    Dado que acesso o site automation practice