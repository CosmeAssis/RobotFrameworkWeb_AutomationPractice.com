*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${url}         http://automationpractice.com/
${HOME_BTN_SIGNIN}    'login'
${HOME_CATEGORY_WOMEN}             //a[contains(@title,'Women')]

*** Keywords ***
Dado que acesso o site automation practice
    Go To    url=${url}

E clico na categoria Women
    Click Element    ${HOME_CATEGORY_WOMEN}

E o cliente deseja realizar um cadastro
    Click Element    xpath=//a[contains(@class,${HOME_BTN_SIGNIN})]

E clico em Sign in
    E o cliente deseja realizar um cadastro

Dado que eu esteja realizando uma compra
    Dado que acesso o site automation practice