*** Settings ***
Documentation    Suíte de teste que percorre uma lista de números usando FOR e IF/ELSE

*** Variables ***
@{NUMEROS}    1    2    3    4    5    6    7    8    9    10

*** Keywords ***
Percorrer a lista de números e identificar o 5 e o 10
    FOR    ${NUMERO}    IN    @{NUMEROS}
        IF    ${NUMERO} == 5 or ${NUMERO} == 10
            Log    Eu sou o número ${NUMERO}!
        ELSE
            Log    Eu não sou o número 5 e nem o 10!
        END
    END

*** Test Cases ***
Caso de Teste 08 - Identificar os Números 5 e 10 na Lista
    [Documentation]    Esse teste percorre uma lista de números e identifica quando o número é 5 ou 10
    [Tags]    for    if
    Percorrer a lista de números e identificar o 5 e o 10
