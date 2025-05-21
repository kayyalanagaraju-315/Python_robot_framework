*** Settings ***
Library    SeleniumLibrary
Library    ../resources/libraries/common_keywords.py
Resource    ../resources/Variables/locators.resource
Library     BuiltIn
Library    DateTime
Library    OperatingSystem


*** Variables ***
${force_scale}        --force-device-scale-factor=0.85


*** Keywords ***
Access URL
    [Arguments]    ${url}      
    ${options}=    Evaluate    __import__('selenium.webdriver.chrome.options', fromlist=['Options']).Options()    sys
    Call Method    ${options}    add_experimental_option    detach    ${True}
    Call Method    ${options}    add_argument    --incognito        #Open in incognito mode
    Call Method    ${options}    add_argument    --disable-cache    #Disable cache
    Call Method    ${options}    add_argument    --fast-start        #Fast start
    Call Method    ${options}    add_argument    --start-maximized    #Start maximized
    Call Method    ${options}    add_argument    ${force_scale}    #decreasing the window resolution
    Call Method    ${options}    add_argument    --ignore-certificate-errors    #Ignore certificate errors
    call Method    ${options}    add_argument    --disable-popup-blocking        #disable the popup blocker
    call Method    ${options}    add_argument    --disable-gpu    #disable GPU hardware acceleration
    call Method    ${options}    add_argument    --no-sandbox    #run without sandbox
    ${loggingPrefs}=    Evaluate    {"performance": "ALL"}    json
    Call Method    ${options}    set_capability    goog:loggingPrefs    ${loggingPrefs}
    ${switches}=   Evaluate    ["enable-logging"]    json
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${switches}
    # Call Method    ${options}    add_experimental_option    excludeSwitches    ["enable-automation"]

    


    ${CHROMEDRIVER_PATH}=    Set Variable    ${CURDIR}${/}drivers/chromedriver.exe
    ${service}=    Evaluate    __import__('selenium.webdriver.chrome.service', fromlist=['Service']).Service(r'''${CHROMEDRIVER_PATH}''')    sys


    Create WebDriver    Chrome    service=${service}    options=${options}

    Go To    ${url} 



Section 
    [Arguments]    ${section}
    Log To Console    \n==========================================${section}==========================================\n

Test Setup Steps
    Section    Test Setup Steps    
    ${START_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    ${START_TIME}=  Get Current Date    result_format=%H:%M:%S 
    
    log to console    "\n TestCase Execution Start Date and Time is : ${START_DATE} ${START_TIME} \n"

    Set Suite Variable    ${START_DATE}    ${START_DATE}
    Set Suite Variable    ${START_TIME}    ${START_TIME}

    Run Keyword And Ignore Error    Empty Directory    results/${TEST_NAME}
    Set Screenshot Directory    results/${TEST_NAME}

Test Teardown Steps
    Section    Test Teardown Steps    
    ${END_DATE}=  Get Current Date    result_format=%d-%m-%Y 
    ${END_TIME}=  Get Current Date    result_format=%H:%M:%S 

    log to console    "\n TestCase Execution End Date and Time is : ${END_DATE} ${END_TIME} \n"

    Set Test Variable    ${END_DATE}    ${END_DATE}
    Set Test Variable    ${END_TIME}    ${END_TIME}

    ${EXECUTION_TIME}       Execution_TIme    ${START_TIME}    ${END_TIME}    
    Log To Console    "\n TestCase Execution Time is : ${EXECUTION_TIME} \n"

    Execute JavaScript    window.localStorage.clear(); window.sessionStorage.clear(); 
    
    close All Browsers
    log to console    "\n Successfully closed the browser \n"

Input
    [Arguments]    ${locator}    ${text}
    Log To Console    \nInput Text : ${text} to the locator : ${locator} \n   
    IF    '${locator}[1]'=='/'
        Wait Until Keyword Succeeds    30    3    input Text    ${locator}    ${text}    clear=True
    ELSE
        Wait Until Keyword Succeeds    30    3    input Text    //*[contains(@placeholder,"${locator}")]    ${text}    clear=True
    END
    
