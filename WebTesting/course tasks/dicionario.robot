*** Settings ***
Documentation    Suíte de teste que imprime no console os meses do ano e a quantidade de dias de cada um

*** Variables ***
&{DIAS_DO_MES}    Janeiro=31    Fevereiro=28    Março=31    Abril=30    Maio=31    Junho=30    Julho=31    Agosto=31    Setembro=30    Outubro=31    Novembro=30    Dezembro=31

*** Test Cases ***
Caso de Teste 06 - Imprimir os Meses e a Quantidade de Dias no Console
    [Documentation]    Esse teste imprime no console, um a um, cada mês do ano e a sua respectiva quantidade de dias
    [Tags]    dicionario    console
    Log To Console    Janeiro possui ${DIAS_DO_MES}[Janeiro] dias
    Log To Console    Fevereiro possui ${DIAS_DO_MES}[Fevereiro] dias
    Log To Console    Março possui ${DIAS_DO_MES}[Março] dias
    Log To Console    Abril possui ${DIAS_DO_MES}[Abril] dias
    Log To Console    Maio possui ${DIAS_DO_MES}[Maio] dias
    Log To Console    Junho possui ${DIAS_DO_MES}[Junho] dias
    Log To Console    Julho possui ${DIAS_DO_MES}[Julho] dias
    Log To Console    Agosto possui ${DIAS_DO_MES}[Agosto] dias
    Log To Console    Setembro possui ${DIAS_DO_MES}[Setembro] dias
    Log To Console    Outubro possui ${DIAS_DO_MES}[Outubro] dias
    Log To Console    Novembro possui ${DIAS_DO_MES}[Novembro] dias
    Log To Console    Dezembro possui ${DIAS_DO_MES}[Dezembro] dias
