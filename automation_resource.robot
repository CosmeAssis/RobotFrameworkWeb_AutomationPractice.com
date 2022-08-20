*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${brownser}    firefox
${url}         http://automationpractice.com/

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${brownser}
    Maximize Browser Window

Fechar o navegador
    Close Browser

##CN0001-Criação de novo cadastro no site
Dado que acesso o site automation practice
    Go To    url=${url}
E o cliente deseja realizar um cadastro
Quando entrar com as informações de cadastro
Então um novo cadastro é criado