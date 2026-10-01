*** Settings ***
Documentation    Recursos em Gherkin (BDD) para os testes de carrinho da Amazon.com.br
Resource         ../amazon_resources.robot
Resource         amazon_cart_resources.robot

*** Keywords ***
Dado que estou na home page da Amazon.com.br
    Abrir o navegador
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "${PRODUTO}" no carrinho
    Buscar e adicionar o produto "${PRODUTO}" no carrinho

Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E existe o produto "${PRODUTO}" no carrinho
    Buscar e adicionar o produto "${PRODUTO}" no carrinho
    Então o produto "${PRODUTO}" deve ser mostrado no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Remover o produto "${PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

Buscar e adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Adicionar o produto "${PRODUTO}" no carrinho
