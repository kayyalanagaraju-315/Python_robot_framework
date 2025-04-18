*** Settings ***
Library    SeleniumLibrary
Library    ../resources/libraries/common_keywords.py
Resource    ../resources/Variables/locators.resource


*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}    chrome
${force_scale}        --force-device-scale-factor=0.85

*** Keywords ***
Access URL
    [Arguments]    ${url}
    Section     Open URL         
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_experimental_option    detach    ${True}
    Call Method    ${options}    add_argument    --fast
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    ${force_scale}
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    call Method    ${options}    add_argument    --disable-popup-blocking
    call Method    ${options}    add_argument    --disable-gpu
    call Method    ${options}    add_argument    --no-sandbox
    call Method    ${options}    add_argument    --disable-application-cache


    Create Webdriver    Chrome    options=${options}
    Go To    ${url}

Section 
    [Arguments]    ${section}
    Log To Console    \n==========================================${section}==========================================\n




