*** Settings ***
Library    SeleniumLibrary

Resource       ${CURDIR}/ext/setup_teardown.robot
Test Setup     Acessar sistema do Organo
Test Teardown  Fechar sistema do Organo

*** Variables ***
${ERRO_CAMPO_NOME}        id:form-nome-erro
${ERRO_CAMPO_CARGO}       id:form-cargo-erro
${ERRO_CAMPO_TIME}        id:form-times-erro

*** Test Cases ***
Teste #1: Verificar erro de campos obrigatórios no formulário
    Dado que eu não preencho os campos do formulário
    Quando clicar no botão de criar
    Então devo visualizar mensagens de erro sobre os campos obrigatórios

*** Keywords ***
Dado que eu não preencho os campos do formulário
    Sleep    1s
Quando clicar no botão de criar
    Click Element    ${BOTAO_CARD}
    Capture Element Screenshot    ${FORM_CADASTRO}

Então devo visualizar mensagens de erro sobre os campos obrigatórios
    Element Should Be Visible    ${ERRO_CAMPO_NOME}
    Element Should Be Visible    ${ERRO_CAMPO_CARGO}
    Element Should Be Visible    ${ERRO_CAMPO_TIME}