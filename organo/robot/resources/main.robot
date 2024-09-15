*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary  locale=pt_BR

Resource       ${CURDIR}/pages/cadastro.robot
Resource       ${CURDIR}/shared/setup_teardown.robot