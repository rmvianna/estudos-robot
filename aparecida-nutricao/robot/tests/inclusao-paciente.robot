*** Settings ***
Library        SeleniumLibrary

Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Variables ***
${URL}                    file:///C:/Renato/estudos-javascript/code/index.html

*** Test Cases ***
Teste #1: Adicionar novo paciente
    Dado que eu preencho os dados de um novo paciente
    Quando clicar no botão de adicionar
    Então devo visualizar o novo paciente na tabela

Teste #2: Validar campos obrigatórios
    Dado que eu não preencho dados de um novo paciente
    Quando clicar no botão de adicionar
    Então devo visualizar lista de erros

Teste #3: Validar campos numéricos
    Dado que eu não preencho os dados corretamente de um novo paciente
    Quando clicar no botão de adicionar
    Então devo visualizar lista de erros

*** Keywords ***
Abrir Navegador
    Open Browser   ${URL}

Fechar Navegador
    Close Browser

Dado que eu preencho os dados de um novo paciente
    Input Text    id:nome      Pedro
    Input Text    id:peso      23
    Input Text    id:altura    1.23
    Input Text    id:gordura   8

Dado que eu não preencho dados de um novo paciente
    Sleep  1s

Dado que eu não preencho os dados corretamente de um novo paciente
    Input Text    id:nome      Pedro
    Input Text    id:peso      -5
    Input Text    id:altura    10000
    Input Text    id:gordura   abc

Quando clicar no botão de adicionar
    Capture Element Screenshot    id:form-adiciona
    Click Element    id:adicionar-paciente

Então devo visualizar o novo paciente na tabela
    Capture Element Screenshot    id:tabela-pacientes
    Element Text Should Be    //tbody[@id='tabela-pacientes']/tr[last()]/td[@class='info-nome']    Pedro

Então devo visualizar lista de erros
    Capture Element Screenshot    id:mensagens-erro
    Element Should Be Visible     id:mensagens-erro