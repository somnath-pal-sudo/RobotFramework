*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${list2}          \
@{list1}

*** Test Cases ***
TC01_List
    Open Browser    https://www.nextgendigital.com/    Edge
    Maximize Browser Window
    Click Element    //li/a/span[text()='About']
    @{list1}    Get WebElements    //*[@id="navbar"]/ul/li[2]/ul
    FOR    ${list2}    IN    @{list1}
    Log    ${list2}
