*** Settings ***
Documentation    Testes automatizados Web utilizando o Robot Framework + Selenium.
Resource    automation_resource.robot
##Execução antes de iniciar o teste
Test Setup       Abrir o navegador
##Execução após execução do teste
Test Teardown    Fechar o navegador

*** Test Cases ***
CN0001-Criação de novo cadastro no site
    [Tags]    novo_cadastro
    Dado que acesso o site automation practice
    E o cliente deseja realizar um cadastro
    Quando entrar com as informações de cadastro
    Então um novo cadastro é criado

CN0002-Login com sucesso no Automation Practice
    [Tags]    login_sucesso
    Dado que acesso o site automation practice 
    E clico em Sign In
    Quando preencho o campo email
    #E preencho o campo senha
    #E clico no botão Sign In
    #Então sou direcionado para a pagina com titulo My account - My Store