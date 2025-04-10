*** Settings ***
Library    SeleniumLibrary
Library    ../../resources/libraries/common_keywords.py
Resource    ../resources/Variables/locators.resource


*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}    chrome

*** Keywords ***
Access URL
    [Arguments]    ${url}    ${browser}
    Section     Open URL
    # ${browser}=    get_driver
    # Open Browser    ${url}    ${browser}
    ${driver}=    get_driver    ${url}
    ${title}=      Get Title    
    Log    ${title}
    Should Be Equal As Strings    ${browser.title}    OrangeHRM            


Section 
    [Arguments]    ${section}
    Log To Console    \n==========================================${section}==========================================\n




