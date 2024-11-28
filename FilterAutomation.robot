*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot

*** Test Cases ***
TC01_Filtertest
    Open Browser    https://automationbookstore.dev/    Edge
    Page Should Contain Element    //input[contains(@id,'searchBar')]
    Input Text    //input[contains(@id,'searchBar')]    test automation
    Page Should Contain Element    //h2[text()='Test Automation in the Real World']
    Page Should Contain Element    //h2[text()='Experiences of Test Automation']
