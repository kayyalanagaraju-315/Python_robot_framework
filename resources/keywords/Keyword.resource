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
    ${START_TIME}=  get_time
    
    Access URL   ${url}
    ${title}=      Get Title
    log to console    "The Website Title is : ${title}"
    Should Be Equal As Strings    ${title}    OrangeHRM
    log to console    "\n Successfully launched the URL \n"
    Wait Until Element Is Visible    ${login_username}    
    Input Text    ${login_username}     ${username}
    Input Text    ${login_password}    ${password}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_success_message}

    ${END_TIME}=     get_time 
    log to console    "The ${TEST_NAME} Start Time is : ${START_TIME}"
    log to console    "The ${TEST_NAME} End Time is : ${END_TIME}"

    

    # ${EXECUTION_TIME} =  Evaluate  (float(${END_TIME}) - float(${START_TIME})) / 1000
    # Log To Console    Execution time in seconds: ${EXECUTION_TIME}

    close browser
    log to console    "\n Successfully closed the browser \n" 

    # Capture Page Screenshot



