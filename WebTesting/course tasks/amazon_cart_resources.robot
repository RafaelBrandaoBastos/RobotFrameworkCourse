*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Visible    locator=//span[contains(.,'${PRODUTO}')]
    Click Element    locator=//span[contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=id=add-to-cart-button
    Click Button    locator=add-to-cart-button

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Click Element    locator=id=nav-cart
    Wait Until Page Contains    text=${PRODUTO}

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//input[@value='Excluir']

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//*[contains(.,'Seu carrinho está vazio')]
