# Guia do Rafa para Robot framework
O Robot Framework é um framework de automação de código aberto para automação de testes e automação de processos robóticos (RPA). Ele conta com o suporte da Robot Framework Foundation e é amplamente utilizado na indústria.

## Pré requisitos
Instalar o python: https://www.python.org/downloads/

<img width="321" height="83" alt="656607709-45ee87af-b37f-4e59-b51d-43ebe8aba24e" src="https://github.com/user-attachments/assets/cba2d7d5-62be-4a7a-9781-fb6b81c99b76" />


## Instalação 
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
## SeleniumLibrary
Todas as keywords da SeleniumLibrary que precisam interagir com um elemento em uma página da web recebem um argumento, geralmente chamado de *locator* (localizador), que especifica como encontrar o elemento.
```pip install --upgrade robotframework-seleniumlibrary```

### Pesquisar Keyworks
<img width="1725" height="527" alt="image" src="https://github.com/user-attachments/assets/9822bfaa-e586-4e57-891a-a1d708a02948" />
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

### Exemplo de implementção
```robotframework
*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Abringo amazon
    [Tags]    menus    categorias
    Acessar a home page do site Amazon.com.br
```
```
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome
```

## Dicas
### Lidar com captcha
Então faça alguma dessas sugestões abaixo:
- Antes de rodar o teste na sua máquina pelo Robot, abra o navegador manualmente como "Anônimo", navegue até a página da Amazon.com e resolva o captcha manualmente, depois volte e tente rodar o teste normalmente.
- Se não resolver, adicione a keyword Sleep   25s no código logo após a keyword Go To para poder dar tempo de você digitar o código manualmente. Daí é só aguardar o tempo do Sleep acabar que a execução do teste continuará normalmente.
### Maximizar o browser para aparecer
```robotframework
*** Keywords ***
Abrir o navegador
	Open Browser    ${URL}    chrome
	Maximize Browser Window
```
