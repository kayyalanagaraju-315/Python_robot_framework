*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/Generic_Methods.resource
Resource    ../resources/test_data/data.resource
Resource    ../resources/Variables/locators.resource
Library     BuiltIn
Library    DateTime


*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${START_TIME}     None
${END_TIME}       None
${EXECUTION_TIME}     None

*** Keywords ***
Launching the URL
    Section    Launching the URL    
    Access URL   ${url}
    ${title}=      Get Title
    log to console    "Website Title is : ${title}"
    Should Be Equal As Strings    ${title}    OrangeHRM
    log to console    "\n Successfully launched the URL \n"
    Wait Until Element Is Visible    ${login_username}    
    Input Text    ${login_username}     ${username}
    Input Text    ${login_password}    ${password}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_success_message}

Test Setup Steps
    Section    Test Setup Steps    
    ${START_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    log to console    "\TestCase Execution Start Date is : ${START_DATE}"
    ${START_TIME}=  Get Current Date    result_format=%H:%M:%S 
    log to console    "TestCase Execution Start Time is : ${START_TIME}\n"

    Set Test Variable    ${START_DATE}    ${START_DATE}
    Set Test Variable    ${START_TIME}    ${START_TIME}

Test Teardown Steps
    Section    Test Teardown Steps    
    ${END_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    log to console    "\TestCase Execution End Date is : ${END_DATE}"
    ${END_TIME}=  Get Current Date    result_format=%H:%M:%S 
    log to console    "TestCase Execution End Time is : ${END_TIME}\n"

    Set Test Variable    ${END_DATE}    ${END_DATE}
    Set Test Variable    ${END_TIME}    ${END_TIME}

    ${EXECUTION_TIME}       Execution_TIme    ${START_TIME}    ${END_TIME}    
    Log To Console    "\nTotal TestCase Execution Time is : ${EXECUTION_TIME}\n"
    
    close All Browsers
    log to console    "\n Successfully closed the browser \n"
