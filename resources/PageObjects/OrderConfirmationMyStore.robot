*** Settings ***
Resource    ../LibrariesBase/Libraries.robot

*** Variables ***
${OCMYSTORE_BTN_CONFIRM_ORDER}    //span[contains(.,'I confirm my order')]
${OCMYSTORE_PAGE_SUBHEADING}      //h3[contains(.,'Bank-wire payment.')]
${OCMYSTORE_MSG_ORDER_COMPLETE}   //strong[contains(.,'Your order on My Store is complete.')]

*** Keywords ***
Então a mensagem Your order on My Store is complete é exibida após concluir compra
    Wait Until Element Is Visible    ${OCMYSTORE_PAGE_SUBHEADING}    timeout=10s
    Click Element   ${OCMYSTORE_BTN_CONFIRM_ORDER}
    Wait Until Element Is Visible   ${OCMYSTORE_MSG_ORDER_COMPLETE}   timeout=10s