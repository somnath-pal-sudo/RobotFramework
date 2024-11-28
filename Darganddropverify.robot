*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_Draganddropverify
    Open Browser    https://demo.automationtesting.in/Static.html    Edge
    Maximize Browser Window
    Set Selenium Implicit Wait    .5
    Element Should Be Visible    //div/img[@id='angular']
    Drag And Drop    //div/img[@id='angular']    //*[@id='droparea']

