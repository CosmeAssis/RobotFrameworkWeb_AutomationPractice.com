*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${MYACCT_MYSTORE_SUBMENU_WOMEN}    locator=//a[contains(@title,'Women')]

*** Keywords ***
E clico na opção Women
    Click Element    ${MYACCT_MYSTORE_SUBMENU_WOMEN}
    Wait Until Element Is Visible    locator=//span[@class='cat-name'][contains(.,'Women')]    timeout=10s

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}