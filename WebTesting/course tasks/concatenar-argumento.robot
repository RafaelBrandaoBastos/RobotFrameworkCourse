*** Settings ***
Documentation    Suíte de teste que gera um e-mail customizado a partir de nome, sobrenome e uma palavra aleatória
Library          String

*** Keywords ***
Gerar e-mail customizado para "${NOME}" "${SOBRENOME}"
    ${PALAVRA_ALEATORIA}=    Generate Random String    6    [LETTERS][NUMBERS]
    ${EMAIL}=    Catenate    SEPARATOR=    ${NOME}    ${SOBRENOME}    ${PALAVRA_ALEATORIA}    @testerobot.com
    RETURN    ${EMAIL}

*** Test Cases ***
Caso de Teste 07 - Gerar E-mail Customizado no Console
    [Documentation]    Esse teste gera um e-mail customizado a partir de nome, sobrenome e uma palavra aleatória
    ...                e imprime o resultado no console
    [Tags]    email    console
    ${EMAIL_GERADO}=    Gerar e-mail customizado para "May" "Fernandes"
    Log To Console    ${EMAIL_GERADO}
