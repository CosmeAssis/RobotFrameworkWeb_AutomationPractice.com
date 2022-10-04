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

Quando adicionar o produto Faded Short Sleeve T-shirts ao carrinho
    Click Element    locator=//a[@class='product-name'][contains(.,'Faded Short Sleeve T-shirts')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Faded Short Sleeve T-shirts')]    timeout=10s
    Click Element    locator=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    locator=//h2[contains(.,'Product successfully added to your shopping cart')]    timeout=10s
    Click Element    locator=//span[contains(@class,'cross')]

E adicionar o produto Blouse no carrinho
    Click Element    locator=//a[contains(@class,'home')]
    Click Element    locator=//a[contains(@title,'Women')]
    Wait Until Element Is Visible    locator=//img[contains(@title,'Blouse')]    timeout=10s
    Click Element    locator=//a[@class='product-name'][contains(.,'Blouse')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Blouse')]
    Click Element    locator=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    locator=//h2[contains(.,'Product successfully added to your shopping cart')]    timeout=10s
    Click Element    locator=//span[contains(.,'Proceed to checkout')]