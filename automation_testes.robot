*** Settings ***
Documentation    Testes automatizados Web utilizando o Robot Framework + Selenium.
##Execução antes de iniciar o teste
Test Setup       Abrir o navegador
##Execução após execução do teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CN0001-Criação de novo cadastro no site
    Dado que acesso o site automation practice
    E o cliente deseja realizar um cadastro
    Quando entrar com as informações de cadastro
    Então um novo cadastro é criado