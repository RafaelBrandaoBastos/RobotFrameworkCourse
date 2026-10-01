*** Settings ***
Documentation    Suíte de teste que imprime os meses do ano no console

*** Variables ***
@{MESES_DO_ANO}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Caso de Teste 05 - Imprimir os Meses do Ano no Console
    [Documentation]    Esse teste imprime no console, um a um, cada mês do ano contido na lista
    [Tags]    lista    console
    Log To Console    ${MESES_DO_ANO}[0]
    Log To Console    ${MESES_DO_ANO}[1]
    Log To Console    ${MESES_DO_ANO}[2]
    Log To Console    ${MESES_DO_ANO}[3]
    Log To Console    ${MESES_DO_ANO}[4]
    Log To Console    ${MESES_DO_ANO}[5]
    Log To Console    ${MESES_DO_ANO}[6]
    Log To Console    ${MESES_DO_ANO}[7]
    Log To Console    ${MESES_DO_ANO}[8]
    Log To Console    ${MESES_DO_ANO}[9]
    Log To Console    ${MESES_DO_ANO}[10]
    Log To Console    ${MESES_DO_ANO}[11]
