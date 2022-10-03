*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${MYACCT_MYSTORE_SUBMENU_WOMEN}        //a[contains(@title,'Women')]
${MYACCT_MYSTORE_PAGEHEADING_WOMEN}    //span[@class='cat-name'][contains(.,'Women')]

*** Keywords ***
E clico na opção Women
    Click Element    ${MYACCT_MYSTORE_SUBMENU_WOMEN}
    Wait Until Element Is Visible     ${MYACCT_MYSTORE_PAGEHEADING_WOMEN}   timeout=10s

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}