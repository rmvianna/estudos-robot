*** Settings ***
Resource       ${CURDIR}/../resources/main.robot
Test Setup     Acessar sistema do Organo
Test Teardown  Fechar sistema do Organo

*** Test Cases ***
Teste #1: Verificar erro de campos obrigatórios no formulário
    Dado que eu não preencho os campos do formulário
    Quando clicar no botão de criar
    Então devo visualizar mensagens de erro sobre os campos obrigatórios