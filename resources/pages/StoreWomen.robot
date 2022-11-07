*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${SW_PRODUCT_CATEGORY_WOMEN}    //span[@class='cat-name'][contains(.,'Women')]
${SW_SELECT_PRICE_ASC}          id:selectProductSort  
${SW_PRODUCT_FADED}             //a[contains(text(),'Faded Short Sleeve T-shirts')]    

*** Keywords ***
Quando filtrar para ordenar os preços por ordem decrescente
    Wait Until Element Is Visible    ${SW_PRODUCT_CATEGORY_WOMEN}
    Select From List By Value        ${SW_SELECT_PRICE_ASC}    price:asc 

Então são exibidas as peças ordenas do menor para o maior valor
    Wait Until Element Is Visible    ${SW_PRODUCT_FADED}