*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot

*** Test Cases ***
TC01_Login
    Open Browser    https://login.yahoo.com/account/create?intl=us&specId=usernameregsimplified&done=https%3A%2F%2Fwww.yahoo.com    Edge
    Sleep    2
    objectsonpage
    Defaultnameandmailanddob
    Sleep    2

TC_02_Userdoesnotenterdetails
    Loginnavigatetourl
    Emptydetails

TC03_Invalidmailformat
    Loginnavigatetourl
    Wait Until Keyword Succeeds    2    1    Click Element    //*[@id="regform"]/p[3]/a
    InvalidmailFormat
