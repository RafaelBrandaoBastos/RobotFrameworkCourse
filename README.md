# Guia do Rafa para Robot framework
O Robot Framework é um framework de automação de código aberto para automação de testes e automação de processos robóticos (RPA)

<img width="2560" height="1060" alt="image" src="https://github.com/user-attachments/assets/249de063-853a-4a26-8383-fd2445861014" />

## 1 Pré requisitos
Instalar o python: https://www.python.org/downloads/

<img width="321" height="83" alt="656607709-45ee87af-b37f-4e59-b51d-43ebe8aba24e" src="https://github.com/user-attachments/assets/cba2d7d5-62be-4a7a-9781-fb6b81c99b76" />


## 2 Instalação 
``` $ pip install robotframework
Collecting robotframework
  Downloading robotframework-7.4.2-py3-none-any.whl.metadata (7.6 kB)
Downloading robotframework-7.4.2-py3-none-any.whl (807 kB)
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 807.1/807.1 kB 8.4 MB/s  0:00:00
Installing collected packages: robotframework
Successfully installed robotframework-7.4.2 
```
```
$ robot --version
Robot Framework 7.4.2 (Python 3.12.0 on darwin)
```

## 3 Comandos Úteis
Executa todos os testes do arquivo.
```
robot amazon_tests.robot
```

Executa somente um caso teste chamado caso de teste
```
robot -t "Caso de Teste 02 - Pesquisa de um Produto" amazon_tests.robot
```

Executa testes que possuem a tag menus.
```
robot -i menus amazon_tests.robot
```

Executa todos os testes, exceto os que possuem a tag busca_produtos.
```
robot -e busca_produtos amazon_tests.robot
```

Executa uma suíte específica pelo nome.
```
robot -s "Amazon Tests" amazon_tests.robot
```

Executa e os resultados em uma pasta chamada resultados.
```
robot -d resultados amazon_tests.robot
```

## 3 Instalação de Library
Todas as keywords da SeleniumLibrary que precisam interagir com um elemento em uma página da web recebem um argumento, geralmente chamado de *locator* (localizador), que especifica como encontrar o elemento.
https://github.com/robotframework/SeleniumLibrary
```pip install --upgrade robotframework-seleniumlibrary```

### 3.1 Pesquisar Keyworks na Library
Acesse: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

<img width="1725" height="527" alt="image" src="https://github.com/user-attachments/assets/9822bfaa-e586-4e57-891a-a1d708a02948" />

## 4 Exemplo de implementção Open Browser
```robotframework
*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Abringo amazon
    [Tags]    menus    categorias
    Acessar a home page do site Amazon.com.br
```
```robotframework
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome

Fechar o navegador
	Close Browser
```

## 5 Procurando elementos na DOM
<img width="2552" height="591" alt="image" src="https://github.com/user-attachments/assets/5a340ad6-de58-4756-9251-acdef3f038cb" />

```robotframework
*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônicos do site
    [Tags]    menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
```

```robotframework
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


Acessar a home page do site Amazon.com.br
	Go To    ${URL}
	Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
	Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
	Wait Until Page Contains    text=${HEADER ELETRONICOS_TEXT}
```
## 6 Dicas
### 6.1 Acessar logs
```
Log:     C:\Users\BASR\OneDrive - Hexagon\Documentos\RobotFrameworkCourse\results\log.html
```

### 6.2 Lidar com captcha
Então faça alguma dessas sugestões abaixo:
- Antes de rodar o teste na sua máquina pelo Robot, abra o navegador manualmente como "Anônimo", navegue até a página da Amazon.com e resolva o captcha manualmente, depois volte e tente rodar o teste normalmente.
- Se não resolver, adicione a keyword Sleep   25s no código logo após a keyword Go To para poder dar tempo de você digitar o código manualmente. Daí é só aguardar o tempo do Sleep acabar que a execução do teste continuará normalmente.

### 6.3 Maximizar o browser para aparecer
```robotframework
*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window
```

### 6.4 Passar parametro
```robotframework
*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    Verificar se o titulo da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
```
```robotframework
*** Keywords ***
Verificar se o titulo da página fica "${TITULO}"
	Title Should Be    title=${TITULO}
```
### 6.5 Screenshots
```robotframework
*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
```

### 6.6 Usar barra de pesquisa / Locator só com ID do componente
```robotframework
*** Test Cases ***
Caso de Teste 02 - Pesquisa de um Produto
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
```
```robotframework
*** Keywords ***
Digitar o nome de produto "${NOME-DO-PRODUTO}" no campo de pesquisa
	Input Text    locator=twotabsearchtextbox    text=${NOME-DO-PRODUTO}
```
