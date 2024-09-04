*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${ERRO_CAMPO_NOME}        id:form-nome-erro
${CAMPO_CARGO}            id:form-cargo
${ERRO_CAMPO_CARGO}       id:form-cargo-erro
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${ERRO_CAMPO_TIME}        id:form-times-erro
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]
${FORM_CADASTRO}          class:formulario

*** Test Cases ***
Verificar se acusa erro de campos obrigatórios no formulário
    Dado que eu acesso o site do Organo
    E não preencho os campos do formulário
    Quando clicar no botão de criar
    Então devo visualizar mensagens de erro sobre os campos obrigatórios

*** Keywords ***
Dado que eu acesso o site do Organo
    Open Browser    url=${URL}    browser=Firefox

E não preencho os campos do formulário
    Sleep    1s
Quando clicar no botão de criar
    Click Element    ${BOTAO_CARD}
    Capture Element Screenshot    ${FORM_CADASTRO}

Então devo visualizar mensagens de erro sobre os campos obrigatórios
    Element Should Be Visible    ${ERRO_CAMPO_NOME}
    Element Should Be Visible    ${ERRO_CAMPO_CARGO}
    Element Should Be Visible    ${ERRO_CAMPO_TIME}
    Close Browser