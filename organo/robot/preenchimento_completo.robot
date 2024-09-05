*** Settings ***
Library        SeleniumLibrary
Resource       ${CURDIR}/ext/setup_teardown.robot
Test Setup     Acessar sistema do Organo
Test Teardown  Fechar sistema do Organo

*** Variables ***
${CAMPO_NOME}              id:form-nome
${CAMPO_CARGO}             id:form-cargo
${CAMPO_IMAGEM}            id:form-imagem
${CAMPO_TIME}              class:lista-suspensa
${OPCAO_PROGRAMACAO}       //option[contains(.,'Programação')]
${OPCAO_FRONT}             //option[contains(.,'Front-End')]
${OPCAO_DADOS}             //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}            //option[contains(.,'Devops')] 
${OPCAO_UX}                //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}            //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}          //option[contains(.,'Inovação e Gestão')]
${COLABORADOR}             class:colaborador
${SECAO_COLABORADOR_PROG}  //section[@class='time'][position()=1]

*** Test Cases ***
Verificar se o cadastro de um novo membro no time de Programação funciona
    Dado que eu preencho os campos do formulário
    Quando clicar no botão de criar
    Então o novo membro deve ser adicionado ao card correspondente

*** Keywords ***
Dado que eu preencho os campos do formulário
    Input Text    ${CAMPO_NOME}    Akemi
    Input Text    ${CAMPO_CARGO}    Desenvolvedora
    Input Text    ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}
    Capture Element Screenshot    ${FORM_CADASTRO}

Quando clicar no botão de criar
    Click Element    ${BOTAO_CARD}

Então o novo membro deve ser adicionado ao card correspondente
    Capture Element Screenshot    ${SECAO_COLABORADOR_PROG}
    Element Should Be Visible    ${COLABORADOR}