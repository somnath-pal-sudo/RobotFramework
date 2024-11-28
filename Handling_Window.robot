*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_getWindowHandle
    Open Browser    https://gxd4e.csb.app/    Edge
    Maximize Browser Window
    sleep    2
    Wait Until Element Is Visible    //div/a[text()='Yes, proceed to preview']
    Click Element    //div/a[text()='Yes, proceed to preview']
    Click Element    //*[@id='openwindow']
    ${windows}=    Get Window Handles
    Switch Window    ${windows}[1]
    sleep    2
    Click Element    //div/a[text()='Yes, proceed to preview']
    Wait Until Element Is Visible    //button[text()='Close this window']
    Click Button    //button[text()='Close this window']
    Switch Window    ${windows}[0]
    Alert Should Be Present    //*[@id="openalert"]
