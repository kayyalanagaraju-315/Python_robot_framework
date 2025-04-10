*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/Generic_Methods.resource
Resource    ../resources/test_data/data.resource
Resource    ../resources/Variables/locators.resource

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Launching the URL
    Section    Launching the URL
    Access URL   ${url}   ${browser}
    Maximize Browser Window   
    Wait Until Element Is Visible    ${login_username}    
    Input Text    ${login_username}     ${username}
    Input Text    ${login_password}    ${password}
    Click Element    ${login_button}
    Sleep    5s
    Wait Until Element Is Visible    ${login_success_message}
    # Capture Page Screenshot



