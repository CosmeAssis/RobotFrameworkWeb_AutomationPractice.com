*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Keywords ***
Quando o cliente pesquisar por menor valor
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//span[@class='cat-name'][contains(.,'Women')]


Então será exibido apenas peças com o menor valor
    Select From List By Value    id=selectProductSort    price:asc