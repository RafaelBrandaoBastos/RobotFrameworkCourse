*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir o navegador
    Open Browser    https://www.amazon.com.br    chrome

Fechar o navegador
    Close Browser