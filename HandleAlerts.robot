*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_handleAlerts
    Set Selenium Implicit Wait    .5
    Open Browser    https://demo.automationtesting.in/Alerts.html    Edge
    Maximize Browser Window
    Comment    Click Element    //li[@class='active']//a
    Comment    Click Element    //*[@id="OKTab"]/button
    Comment    Alert Should Be Present    I am an alert box!    ACCEPT
    Click Element    //a[text()='Alert with OK & Cancel ']
    Click Element    //div[@id='CancelTab']//button
    Alert Should Be Present    Press a Button !    DISMISS
    Element Text Should Be    //*[@id="demo"]    You Pressed Cancel

TC02_Handletextintoalert
    Set Selenium Implicit Wait    .5
    Open Browser    https://demo.automationtesting.in/Alerts.html\n    Edge
    Maximize Browser Window
    Click Element    //li//a[text()='Alert with Textbox ']
    Click Element    //button[text()='click the button to demonstrate the prompt box ']
    Input Text Into Alert    Somnath    ACCEPT
    Element Text Should Be    //p[@id='demo1']    Hello Somnath How are you today
