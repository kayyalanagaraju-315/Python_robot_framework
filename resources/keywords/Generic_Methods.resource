*** Settings ***
Library    SeleniumLibrary
Library    ../resources/libraries/common_keywords.py
Resource    ../resources/Variables/locators.resource
Library     BuiltIn
Library    DateTime


*** Variables ***

${browser}    chrome
${force_scale}        --force-device-scale-factor=0.85

*** Keywords ***
Access URL
    [Arguments]    ${url}       
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_experimental_option    detach    ${True}
    Call Method    ${options}    add_argument    --fast-start
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    ${force_scale}
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    call Method    ${options}    add_argument    --disable-popup-blocking
    call Method    ${options}    add_argument    --disable-gpu
    call Method    ${options}    add_argument    --no-sandbox
    call Method    ${options}    add_argument    --disable-application-cache
    call Method    ${options}    add_argument    --disable-extensions
    call Method    ${options}    add_argument    --disable-infobars
    call Method    ${options}    add_argument    --disable-dev-shm-usage
    call Method    ${options}    add_argument    --disable-software-rasterizer
    call Method    ${options}    add_argument    --disable-web-security
    call Method    ${options}    add_argument    --allow-insecure-localhost
    


    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

Section 
    [Arguments]    ${section}
    Log To Console    \n==========================================${section}==========================================\n

Test Setup Steps
    Section    Test Setup Steps    
    ${START_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    ${START_TIME}=  Get Current Date    result_format=%H:%M:%S 
    
    log to console    "\n TestCase Execution Start Date and Time is : ${START_DATE} ${START_TIME} \n"

    Set Test Variable    ${START_DATE}    ${START_DATE}
    Set Test Variable    ${START_TIME}    ${START_TIME}

Test Teardown Steps
    Section    Test Teardown Steps    
    ${END_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    ${END_TIME}=  Get Current Date    result_format=%H:%M:%S 

    log to console    "\n TestCase Execution End Date and Time is : ${END_DATE} ${END_TIME} \n"

    Set Test Variable    ${END_DATE}    ${END_DATE}
    Set Test Variable    ${END_TIME}    ${END_TIME}

    ${EXECUTION_TIME}       Execution_TIme    ${START_TIME}    ${END_TIME}    
    Log To Console    "\n TestCase Execution Time is : ${EXECUTION_TIME} \n"
    
    close All Browsers
    log to console    "\n Successfully closed the browser \n"


