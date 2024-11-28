*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String
Resource          CommnlyUsedKeywords.robot
Library           Screenshot
Library           DependencyLibrary

*** Test Cases ***
TC01_Login&PageValidation
    OpenBrowser
    OnlinemktPageValidation
    CustomerLogin_mkt

TC02_ForgotPassword
    Forgotpassword-user

TC03_UserProductsSelection
    Depends On Test    TC01_Login&PageValidation
    UserProductSelection

*** Keywords ***
OpenBrowser
    SeleniumLibrary.Open Browser    https://magento.softwaretestingboard.com/    Edge
    Maximize Browser Window
