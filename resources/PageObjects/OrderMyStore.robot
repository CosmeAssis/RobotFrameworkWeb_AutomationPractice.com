*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***

*** Keywords ***
E realizo os proximos passos da venda com pagamento Pay by bank wire
    Wait Until Element Is Visible    locator=//span[contains(.,'01. Summary')]    timeout=10s
    Click Element    locator=//a[@class='button btn btn-default standard-checkout button-medium']
    Wait Until Element Is Visible    locator=//span[contains(.,'03. Address')]    timeout=10s
    Click Element    locator=//button[@type='submit'][contains(.,'Proceed to checkout')]
    Wait Until Element Is Visible    locator=//span[contains(.,'04. Shipping')]    timeout=10s
    Select Checkbox    locator=//input[contains(@type,'checkbox')]
    Click Element    locator=//button[@type='submit'][contains(.,'Proceed to checkout')]
    Wait Until Element Is Visible    locator=//span[contains(.,'05. Payment')]    timeout=10s
    Click Element    locator=//a[@class='bankwire'][contains(.,'Pay by bank wire (order processing will be longer)')]