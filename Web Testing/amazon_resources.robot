*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER ELETRONICOS_TEXT}    Eletrônicos e Tecnologia

*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
	Close Browser

Acessar a home page do site Amazon.com.br
	Go To    ${URL}
	Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu Eletrônicos
	Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase Eletrônicos e Tecnologia
	Wait Until Page Contains    text=${HEADER ELETRONICOS_TEXT}

Verificar se o titulo da página fica "${TITULO}"
	Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
	Element Should Be Visible   locator=//a[contains(.,'${CATEGORIA}')]

Digitar o nome de produto "${NOME-DO-PRODUTO}" no campo de pesquisa
	Input Text    locator=twotabsearchtextbox    text=${NOME-DO-PRODUTO}

Clicar no botão de pesquisa
	Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
	Wait Until Element Is Visible   locator=//span[contains(.,'${PRODUTO}')]