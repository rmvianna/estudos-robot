*** Settings ***
Library        Collections

Variables      ${CURDIR}/../ext/variables.py

Resource       ${CURDIR}/../resources/main.robot
Test Setup     Acessar sistema do Organo
Test Teardown  Fechar sistema do Organo

*** Test Cases ***
Teste #1: Criar um novo membro no time de Programação
    Definir Premissa Teste #1

    Dado que eu preencho os campos do formulário
    Quando clicar no botão de criar
    Então o novo membro deve ser adicionado ao card correspondente

Teste #2: Criar um novo membro em cada time disponível
    FOR    ${idx}    ${time}    IN ENUMERATE    @{TIMES}
        ${cardTime}  Get From List    ${CARDS_TIMES}    ${idx}
        ${listaCargosTime}  Get From Dictionary    ${CARGOS}    ${idx}

        Set Test Variable  ${TIME_ATUAL}  ${time}
        Set Test Variable  ${CARD_TIME_ATUAL}  ${cardTime}
        Set Test Variable  ${LISTA_CARGOS_ATUAL}  ${listaCargosTime}
        
        Dado que eu preencho os campos do formulário
        Quando clicar no botão de criar
        Então o novo membro deve ser adicionado ao card correspondente
    END

*** Keywords ***
Definir Premissa Teste #1
    ${opcaoProgramacao}   Get From List  ${TIMES}  0
    ${cardTimeProgramacao}  Get From List  ${CARDS_TIMES}  0
    ${listaCargosProgramacao}   Get From Dictionary    ${CARGOS}   ${0}

    Set Test Variable  ${TIME_ATUAL}  ${opcaoProgramacao}
    Set Test Variable  ${CARD_TIME_ATUAL}  ${cardTimeProgramacao}
    Set Test Variable  ${LISTA_CARGOS_ATUAL}  ${listaCargosProgramacao}