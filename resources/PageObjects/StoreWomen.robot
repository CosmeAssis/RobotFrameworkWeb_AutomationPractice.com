*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${SW_PRODUCT_CATEGORY_WOMEN}    //span[@class='cat-name'][contains(.,'Women')]
${SW_SELECT_PRICE_ASC}          id:selectProductSort  
${SW_PRODUCT_FADED}                  //a[contains(text(),'Faded Short Sleeve T-shirts')]    

*** Keywords ***
Quando o cliente pesquisar por menor valor

    Wait Until Element Is Visible    ${SW_PRODUCT_CATEGORY_WOMEN}

Então será exibido apenas peças com o menor valor
    Select From List By Value        ${SW_SELECT_PRICE_ASC}    price:asc 
    Wait Until Element Is Visible    ${SW_PRODUCT_FADED}