*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${list1}          \

*** Test Cases ***
TC01_VerifyList
    Open Browser    https://www.nextgendigital.com/\n    Edge
    Maximize Browser Window
    Wait Until Keyword Succeeds    2    2    Page Should Contain Element    //li/a/span[text()='About']
    @{list2}    Get WebElements    //*[@id="navbar"]/ul/li[2]/ul
    FOR    ${list1}    IN    @{list2}
        Log    ${list1}
    END

TC02_SelectListValidation
    Open Browser    https://demo.automationtesting.in/Register.html    Edge
    Set Selenium Implicit Wait    .4
    Maximize Browser Window
    Scroll Element Into View    //div/multi-select
    Click Element    //div/multi-select
    sleep    2
    ${all_list}    Get List Items    //div/multi-select
    Comment    Wait Until Element Contains    //*[@id="basicBootstrapForm"]/div[7]/div/multi-select/div[2]/ul    Arabic
    Comment    Comment    Wait Until Keyword Succeeds    2    3    Page Should Contain List    //ul[@class='ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all']
    Comment    Comment    Select All From List    //*[@id="basicBootstrapForm"]/div[7]/div
    Comment    Scroll Element Into View    css:#basicBootstrapForm>div:nth-child(7)>div>multi-select >div:nth-child(2)>ul
    Comment    Select From List By Index    //a[normalize-space()='Bulgarian']    0
    Comment    Select All From List
    Element Text Should Be

TC03_SelectValidation
    Open Browser    https://demo.automationtesting.in/Register.html    Edge
    Maximize Browser Window
    Comment    Scroll Element Into View    //select[@type='text' and @id='Skills']
    Comment    Click Element    //select[@type='text' and @id='Skills']\n
    Select From List By Value    id:Skills    Adobe InDesign
    Sleep    2

    Select From List By Value    id:Skills     APIs
    Select From List By Index    id:Skills     43

TC04_Dropdownwithfilter
    Open Browser    https://demo.automationtesting.in/Register.html    Edge
    Set Selenium Implicit Wait    .2
    Click Element    //span[@role='combobox']
    Click Element    //input[@type='search']
    Input Text    //input[@type='search']    Denmark







Select the dropdown options CSS by label
    Select From List By Label    id:Skills CSS
