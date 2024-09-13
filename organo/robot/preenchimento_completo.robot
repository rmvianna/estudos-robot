*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary  locale=pt_BR
Library        Collections

Variables      ${CURDIR}/ext/variables.py

Resource       ${CURDIR}/ext/setup_teardown.robot
Test Setup     Acessar sistema do Organo
Test Teardown  Fechar sistema do Organo

*** Variables ***
${CAMPO_NOME}              id:form-nome
${CAMPO_CARGO}             id:form-cargo
${CAMPO_IMAGEM}            id:form-imagem
${CAMPO_TIME}              class:lista-suspensa
@{TIMES}
...       //option[contains(.,'Programação')]
...       //option[contains(.,'Front-End')]
...       //option[contains(.,'Data Science')]
...       //option[contains(.,'Devops')] 
...       //option[contains(.,'UX e Design')]
...       //option[contains(.,'Mobile')]
...       //option[contains(.,'Inovação e Gestão')]
@{CARDS_TIMES}
...       //section[@class='time'][position()=1]
...       //section[@class='time'][position()=2]
...       //section[@class='time'][position()=3]
...       //section[@class='time'][position()=4]
...       //section[@class='time'][position()=5]
...       //section[@class='time'][position()=6]
...       //section[@class='time'][position()=7]
${COLABORADOR}             //div[@class='colaborador']    

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

Dado que eu informo os dados do colaborador do ${time}
    Log To Console    ${time}

Dado que eu preencho os campos do formulário
    ${nome}       FakerLibrary.First Name
    ${cargo}      Evaluate    random.choice($LISTA_CARGOS_ATUAL)  random
    
    Input Text    ${CAMPO_NOME}    ${nome}
    Input Text    ${CAMPO_CARGO}    ${cargo}
    Input Text    ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${TIME_ATUAL}
    Capture Element Screenshot    ${FORM_CADASTRO}

Quando clicar no botão de criar
    Click Element    ${BOTAO_CARD}

Então o novo membro deve ser adicionado ao card correspondente
    ${colaborador}  Catenate  ${CARD_TIME_ATUAL}  ${COLABORADOR}

    Sleep  2s   Aguardar a imagem ser renderizada no browser antes do print
    Capture Element Screenshot    ${CARD_TIME_ATUAL}
    Element Should Be Visible    ${colaborador}