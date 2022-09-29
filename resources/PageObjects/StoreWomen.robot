*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${SW_CATEGORY_WOMEN}             //a[contains(@title,'Women')]
${SW_PRODUCT_CATEGORY_WOMEN}    //span[@class='cat-name'][contains(.,'Women')]

*** Keywords ***
Quando o cliente pesquisar por menor valor
    Click Element    ${SW_CATEGORY_WOMEN}
    Wait Until Element Is Visible    ${SW_PRODUCT_CATEGORY_WOMEN}

Então será exibido apenas peças com o menor valor
    Select From List By Value    id=selectProductSort    price:asc
    Wait Until Element Is Visible    locator=//a[contains(text(),'Faded Short Sleeve T-shirts')]