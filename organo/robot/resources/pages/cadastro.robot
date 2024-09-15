*** Settings ***
Resource       ${CURDIR}/../main.robot

*** Variables ***
${TIME_ATUAL}
${CARD_TIME_ATUAL}

${ERRO_CAMPO_NOME}         id:form-nome-erro
${ERRO_CAMPO_CARGO}        id:form-cargo-erro
${ERRO_CAMPO_TIME}         id:form-times-erro

${BOTAO_CARD}              id:form-botao
${FORM_CADASTRO}           class:formulario
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

*** Keywords ***
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

Dado que eu não preencho os campos do formulário
    Sleep    1s

Então devo visualizar mensagens de erro sobre os campos obrigatórios
    Capture Element Screenshot    ${FORM_CADASTRO}

    Element Should Be Visible    ${ERRO_CAMPO_NOME}
    Element Should Be Visible    ${ERRO_CAMPO_CARGO}
    Element Should Be Visible    ${ERRO_CAMPO_TIME}