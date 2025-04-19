*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/keywords/Keyword.resource
Resource    ../resources/keywords/Step_By_Step.resource
Test Setup    Test Setup Steps
Test Teardown    Test Teardown Steps





*** Test Cases ***
OrangeHRM_Login_Check
    [Documentation]    This will Check the HRM Login
    [Tags]    Testing
    Login Checking HRM Page

