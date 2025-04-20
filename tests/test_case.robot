*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/keywords/Keyword.resource
Resource    ../resources/keywords/Step_By_Step.resource
Test Setup    Test Setup Steps
Test Teardown    Test Teardown Steps





*** Test Cases ***
TestCase_OrangeHRM_Login_Check
    [Documentation]    This will Check the HRM Login
    [Tags]    Testing
    Login Checking HRM Page

TestCase_Automation Exercise
    [Documentation]    This will Check the Automation Demo Site Registration and Login
    # [Tags]    Testing
    Automation Exercise

