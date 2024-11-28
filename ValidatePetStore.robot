*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot
Library           DependencyLibrary
Variables         ../PaymentData.yaml

*** Test Cases ***
TC01_verifywebtable
    Open Browser
    Validate pagecomponents

TC02_usersignin
    Depends On Test    TC01_verifywebtable\n
    petstoreSignin

TC03_PageOperationPetstore
    Depends On Test    TC02_usersignin
    pageoperationpetstore

TC04_PageValidation
    Depends On Test    TC03_PageOperationPetstore
    SpecificPageOperation

TC04_ShoppingCartValidation
    Depends On Test    TC04_Pagevalidation
    ShoppingKartValidation

TC05_PaymentPageValidation
    Depends On Test    TC04_ShoppingCartValidation
    verifypaymentpage

TC06_PaymentConfirmation
    Depends On Test    TC05_PaymentPageValidation
    PaymentConfirmation

*** Keywords ***
OpenBrowser
    SeleniumLibrary.Open Browser    https://petstore.octoperf.com/actions/Catalog.action    Edge
