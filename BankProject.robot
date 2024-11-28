*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot
Library           ExcelLibrary
Library           Collections
Library           DatabaseLibrary
Library           DependencyLibrary
Library           String
Library           Screenshot

*** Test Cases ***
TC01_login&verifyLoginpage
    OpenBrowser
    Maximize Browser Window
    Page Should Contain    XYZ Bank
    Sleep    5s
    Page Should Contain Button    //*[text()[contains(.,'Home')]]
    Page Should Contain Button    //*[text()[contains(.,'Customer Login')]]
    Page Should Contain Button    //*[text()[contains(.,'Bank Manager Login')]]

TC02_CustomerLogin
    Depends On Test    TC01_login&verifyLoginpage
    Bank_CustomerLogin

TC03_CustomerTxnRecords
    Depends On Test    TC02_CustomerLogin
    CustomerTxn

*** Keywords ***
OpenBrowser
    SeleniumLibrary.Open Browser    https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login    Edge
