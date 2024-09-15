*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***
Acessar sistema do Organo
    Open Browser    url=${URL}    browser=Firefox

Fechar sistema do Organo
    Close Browser