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

⚠️Executa e os resultados em uma pasta chamada resultados.
```
robot -d resultados amazon_tests.robot
```

⚠️Alterar valor variáveis
```
robot -v PRODUTO:Xbox amazon_tests.robot
```

## 5 Instalação de Library
Todas as keywords da SeleniumLibrary que precisam interagir com um elemento em uma página da web recebem um argumento, geralmente chamado de *locator* (localizador), que especifica como encontrar o elemento.
https://github.com/robotframework/SeleniumLibrary
```pip install --upgrade robotframework-seleniumlibrary```

### 5.1 Pesquisar Keyworks na Library
Acesse: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

<img width="1725" height="527" alt="image" src="https://github.com/user-attachments/assets/9822bfaa-e586-4e57-891a-a1d708a02948" />

## 6 Exemplo de implementção Open Browser
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

## 7 Procurando elementos na DOM
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
## 8 Dicas
### 8.1 Acessar logs
```
Log:     C:\Users\BASR\OneDrive - Hexagon\Documentos\RobotFrameworkCourse\results\log.html
```

### 8.2 Lidar com captcha
Então faça alguma dessas sugestões abaixo:
- Antes de rodar o teste na sua máquina pelo Robot, abra o navegador manualmente como "Anônimo", navegue até a página da Amazon.com e resolva o captcha manualmente, depois volte e tente rodar o teste normalmente.
- Se não resolver, adicione a keyword Sleep   25s no código logo após a keyword Go To para poder dar tempo de você digitar o código manualmente. Daí é só aguardar o tempo do Sleep acabar que a execução do teste continuará normalmente.

### 8.3 Maximizar o browser para aparecer
```robotframework
*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window
```

### 8.4 Passar parametro
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
### 8.5 Screenshots
```robotframework
*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
```

### 8.6 Usar barra de pesquisa / Locator só com ID do componente
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

### 8.7 Tipos de variáveis
```robotframework
*** Variable ***
# Simples
${SIMPLES} Vamos ver os tipos de variáveis no robot!
# Tipo Lista
@{FRUTAS} morango banana maçã uva abacaxi
# Tipo Dicionário
&{PESSOA} nome=May Fernandes email=mayfernandes@exemplo.com.br idade=28
```
```robotframework
*** Keywords ***
Uma keyword qualquer 01
# Simples
Log ${SIMPLES}
# Lista
Log Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]} 
# Dicionário
Log Nome: ${PESSOA.nome} e email: ${PESSOA.email}
```

### 8.8 Passagem de argumentos
```robotframework
*** Variable ***
&{PESSOA}    nome=May Fernandes    email=mayfernandes@exemplo.com.br    idade=12    sexo=feminino
*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer
```
Envio os argumentos
```robotframework
*** Keywords ***
Uma keyword qualquer
    Uma subkeyword com argumentos    ${PESSOA.nome}    ${PESSOA.email}
    ${MENSAGEM_ALERTA}    Uma subkeyword com retorno    ${PESSOA.nome}    ${PESSOA.idade}
    Log    ${MENSAGEM_ALERTA}
```
recebe argumentos e loga
```robotframework
Uma subkeyword com argumentos
    [Arguments]    ${NOME_USUARIO}    ${EMAIL_USUARIO}
    Log    Nome Usuário: ${NOME_USUARIO}
    Log    Email: ${EMAIL_USUARIO}
```
recebe argumentos, faz operação condicional, e retorna mensagem
```robotframework
Uma subkeyword com retorno
    [Arguments]    ${NOME_USUARIO}    ${IDADE_USUARIO}
    ${MENSAGEM}    Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]    ${MENSAGEM}
```

### 8.9 Logs
```robotframework
*** Variables ***
 
@{FRUTAS} Maçã Banana Laranja Uva
 
 
*** Test Cases ***
 
Exemplo de tipos de log
Demonstrar logs
 
 
*** Keywords ***
 
Demonstrar logs
 
Log To Console ===== LOG NO CONSOLE =====
Log To Console Posso logar na saída do console
 
Log To Console \n===== LOG PADRÃO =====
Log Este é um log informativo padrão.
 
Log To Console \n===== LOG POR NÍVEL =====
Log Informação detalhada para depuração. TRACE
Log Informação de desenvolvimento. DEBUG
Log Informação geral. INFO
Log Aviso importante. WARN
Log Erro encontrado. ERROR
 
Log To Console \n===== LOG MANY =====
Log Many @{FRUTAS}
 
Log To Console \n===== LOG DE ITENS ESPECÍFICOS =====
Log Primeira fruta: ${FRUTAS}[0]
Log Segunda fruta: ${FRUTAS}[1]
Log Frutas selecionadas: ${FRUTAS}[0] - ${FRUTAS}[1]
```

### 8.10 Loops
```robotframework
*** Variables ***

@{FRUTAS}    Maçã    Banana    Laranja
${CONTADOR}    0


*** Test Cases ***

Exemplos de loops
    Loop FOR IN
    Loop FOR IN RANGE
    Loop FOR IN ENUMERATE
    Loop WHILE
    Loop REPEAT KEYWORD


*** Keywords ***

Loop FOR IN

    Log To Console    ===== FOR IN =====

    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log    Fruta atual: ${FRUTA}
    END


Loop FOR IN RANGE

    Log To Console    \n===== FOR IN RANGE =====

    FOR    ${NUMERO}    IN RANGE    5
        Log    Número: ${NUMERO}
    END


Loop FOR IN ENUMERATE

    Log To Console    \n===== FOR IN ENUMERATE =====

    FOR    ${INDICE}    ${FRUTA}    IN ENUMERATE    @{FRUTAS}
        Log    Índice: ${INDICE} | Fruta: ${FRUTA}
    END


Loop WHILE

    Log To Console    \n===== WHILE =====

    ${CONTADOR}=    Set Variable    0

    WHILE    ${CONTADOR} < 5
        Log    Contador: ${CONTADOR}
        ${CONTADOR}=    Evaluate    ${CONTADOR} + 1
    END


Loop REPEAT KEYWORD

    Log To Console    \n===== REPEAT KEYWORD =====

    Repeat Keyword    3 times    Keyword De Exemplo


Keyword De Exemplo
    Log    Executando keyword...

```
