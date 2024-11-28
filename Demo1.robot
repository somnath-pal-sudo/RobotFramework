*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          UserDefinedKeyword.txt    # This is first Resource file

*** Variables ***
${var1}           4    # This is my first Scaler Variable
${var2}           4    # This is the Second Scaler Variable


@{USER}           A    B
&{Credentials}    username=somnath    password=somnath

*** Test Cases ***
TC_01
    [Documentation]    This is my First Test Case. It's used to compare the results.
    ...    *Test Case01* _This will be in Italic_
    [Tags]    LoginTC
    Should Be Equal    ${var1}    ${var2}

TC_02
    [Tags]    Login
    [Setup]    Setup Demo
    Should Not Be Equal As Strings    ${user}[0]    ${user}[1]
    [Teardown]    TearDown Demo

TC_03
    [Setup]    Setup Demo
    Should \ Be Equal As Strings    ${Credentials}[username]    ${Credentials}[password]
    [Teardown]    TearDown Demo

TC_04
    [Tags]    LoginTC
    Should be True     4    4

TC_05
    [Template]    Should Be Equal As Integers    # This is for compare
    [Timeout]    6 seconds    # this is custom timeout
    3    3
    10    10
    20    12
    10    10
    Open Browser
    ExcelLibrary.Write Excel Rows

TC_06
    Comparetwovariables

*** Keywords ***
Setup Demo
    Log To Console    This is Setup

TearDown Demo
    Log To Console    This is Teardown demo
