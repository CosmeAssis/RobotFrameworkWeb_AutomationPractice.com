*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***

*** Keywords ***
E clico na opção Women
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//span[@class='cat-name'][contains(.,'Women')]    timeout=10s

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}