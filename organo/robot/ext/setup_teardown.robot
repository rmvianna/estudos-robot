*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${BOTAO_CARD}             id:form-botao
${FORM_CADASTRO}          class:formulario

*** Keywords ***
Acessar sistema do Organo
    Open Browser    url=${URL}    browser=Firefox

Fechar sistema do Organo
    Close Browser