*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/keywords/Keyword.resource


*** Variables ***
# ${Loc}        None

*** Keywords ***
Login Checking HRM Page
    [Arguments]        #None
    Launching the URL
    # Login HRM Page
    # Login Page Success Message