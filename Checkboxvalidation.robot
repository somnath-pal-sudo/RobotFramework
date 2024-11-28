*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_checkboxValidation
    Open Browser    https://demo.automationtesting.in/Register.html    Edge
    Select Checkbox    //input[@id='checkbox1']
