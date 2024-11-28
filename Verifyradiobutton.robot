*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_verifyRadioButton
    Open Browser    https://demo.automationtesting.in/Register.html    Edge
    Set Selenium Implicit Wait    .5
    Maximize Browser Window
    Page Should Contain Radio Button    //*[@name='radiooptions'and @value='Male']
    Select Radio Button    radiooptions    Male
