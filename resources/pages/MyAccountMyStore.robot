*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${MYACCT_MYSTORE_SUBMENU_WOMEN}        //a[contains(@title,'Women')]
${MYACCT_MYSTORE_PAGEHEADING_WOMEN}    //span[@class='cat-name'][contains(.,'Women')]
${MYACCT_MYSTORE_PRODUTO}              //a[@class='product-name'][contains(.,'Faded Short Sleeve T-shirts')]
${MYACCT_MYSTORE_LABEL_PRODUTO}        //h1[contains(.,'Faded Short Sleeve T-shirts')]
${MYACCT_MYSTORE_BTN_ADDCART}          //span[contains(.,'Add to cart')]
${MYACCT_MYSTORE_MSG_PRODUCT_ADD}      //h2[contains(.,'Product successfully added to your shopping cart')]
${MYACCT_MYSTORE_BTN_CHECKOUT}         //span[contains(@class,'cross')]
${MYACCT_RETURN_HOME}                  //a[contains(@class,'home')]

*** Keywords ***
E clico na opção Women
    Click Element    ${MYACCT_MYSTORE_SUBMENU_WOMEN}
    Wait Until Element Is Visible     ${MYACCT_MYSTORE_PAGEHEADING_WOMEN}   timeout=10s

Então sou direcionado para a pagina com titulo ${MY_ACCOUNT}
    Title Should Be    title=${MY_ACCOUNT}

Quando adicionar o produto Faded Short Sleeve T-shirts ao carrinho
    Click Element    ${MYACCT_MYSTORE_PRODUTO}
    Wait Until Element Is Visible  ${MYACCT_MYSTORE_LABEL_PRODUTO}       timeout=10s
    Click Element    ${MYACCT_MYSTORE_BTN_ADDCART} 
    Wait Until Element Is Visible    ${MYACCT_MYSTORE_MSG_PRODUCT_ADD}    timeout=10s
    Click Element    ${MYACCT_MYSTORE_BTN_CHECKOUT} 

E adicionar o produto Blouse no carrinho
    Click Element    ${MYACCT_RETURN_HOME}
    Click Element    ${MYACCT_MYSTORE_SUBMENU_WOMEN} 
    Wait Until Element Is Visible    locator=//img[contains(@title,'Blouse')]    timeout=10s
    Click Element    locator=//a[@class='product-name'][contains(.,'Blouse')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Blouse')]
    Click Element    locator=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    locator=//h2[contains(.,'Product successfully added to your shopping cart')]    timeout=10s
    Click Element    locator=//span[contains(.,'Proceed to checkout')]