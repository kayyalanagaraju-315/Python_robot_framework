*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/Generic_Methods.resource
Resource    ../resources/test_data/test_data.resource
Resource    ../resources/Variables/locators.resource
Library     BuiltIn
Library    DateTime


*** Variables ***
${START_TIME}     None
${END_TIME}       None
${EXECUTION_TIME}     None
${OrangeHRM_url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Automation_Exercise_url}    https://www.automationexercise.com/

*** Keywords ***
OrangeHRM Launching the URL
    Section    OrangeHRM Launching the URL 
    Access URL   ${OrangeHRM_url}
    ${title}=      Get Title
    log to console    "Website Title is : ${title}"
    Should Be Equal As Strings    ${title}    OrangeHRM
    log to console    "\n Successfully launched the URL \n"
    capture page screenshot    OrangeHRM_Launching_the_URL.png

Login HRM Page
    Section    Login HRM Page
    Wait Until Element Is Visible    ${login_username}    
    Input    ${login_username}     ${username}
    ${en_password}    encrypt_password    ${password}
    ${de_password}    decrypt_password    ${en_password}
    Input    ${login_password}    ${de_password}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_success_message}
    log to console    "\n Successfully Logged In \n"
    capture page screenshot    Login_HRM_Page.png

Automation Exercise Launching the URL
    Section    Automation Exercise Launching the URL
    Access URL   ${Automation_Exercise_url}
    ${title}=      Get Title
    log to console    "Website Title is : ${title}"
    Should Be Equal As Strings    ${title}    Automation Exercise
    log to console    "\n Successfully launched the URL \n"
    Capture Page Screenshot    Automation_Exercise_Launching_the_URL.png

