*** Settings ***
Library           DependencyLibrary
Library           SeleniumLibrary

*** Variables ***
${values}         \

${value}          \
@{values}         Arabic Bulgarian

${index}          \

*** Test Cases ***
TC02_Email
    Open Browser    https://demo.automationtesting.in/Index.html    Edge
    Click Element    //input[@id='email']
    Click Element    //img[@id='enterimg']

TC01_Registration
    Open Browser    https://demo.automationtesting.in/Register.html    edge
    Maximize Browser Window
    Set Selenium Timeout    .5
    Page Should Contain    Register
    Page Should Contain Link    //a[text()='Home']
    Page Should Contain Image    //*[@id="header"]/div/div/div/div[1]/a/img
    Page Should Contain Textfield    //input[@type='text' and @placeholder='First Name']    First Name
    Input Text    //input[@type='text' and @placeholder='First Name']\n    Somnath
    Page Should Contain Textfield    //input[@type='text' and @placeholder='Last Name']    Last Name
    Input Text    //input[@type='text' and @placeholder='Last Name']    Pal
    sleep    2
    Comment    Page Should Contain Textfield    //label[text()='Address']//following::div/textarea
    Input Text    //label[text()='Address']//following::div/textarea    London,UK
    Page Should Contain Textfield    //input[@type='email']
    Input Text    //input[@type='email']    pall.somnath2@gmail.com
    Page Should Contain Textfield    //input[@type='tel']
    Input Text    //input[@type='tel']    9008765432
    Page Should Contain Radio Button    //input[@name='radiooptions' and @value='Male']
    Select Radio Button    radiooptions    Male
    Page Should Contain Checkbox    //input[@id='checkbox1']
    Select Checkbox    //input[@id='checkbox1']
    Page Should Contain    Languages
    Scroll Element Into View    //div[contains(@id,'msdd')]
    Scroll Element Into View    //select[contains(@id,'countries')]
    sleep    2
    Click Element    //div[contains(@id,'msdd')]
    ${dropdown}=    Get WebElement    //div[@id='msdd']
    Mouse Over    //div[@id='msdd']
    Page Should Contain Element    //div[@id='msdd']
    Click Element    //div[@id='msdd']
    Mouse Down    //li[contains(.,'Arabic')]
    Click Element    //li[contains(.,'Arabic')]
    Execute Javascript    var options = arguments[0].options; options[1].selected = true;    ${dropdown}
    Comment    ${headcount}=    Get Element Count    //ul[@class='ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all']
    Comment    FOR    ${index}    IN RANGE    1    ${headcount}+1    1
    Comment    ${values} =    Get List Items    //ul[@class='ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all']    values=True
    Comment    FOR    ${value}    @{values}
    Comment    Log To Console    ${value}
    Comment    List Selection Should Be    @{values}    ${value}
    Comment    Assign Id To Element    //ul[@class='ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all']\n\n    pm
    Comment    Page Should Contain Element    pm
    Comment    @{list1}    Get WebElements    pm
    Comment    Select From List By Value
    Comment    Select From List By Value    //li/a[text()='Arabic']    Arabic

    Comment    Select From List By Label    ${dropdown}    Arabic    Bulgarian
    Select From List By Value    id:Skills    Adobe InDesign
    Click Element    //span[@role='combobox']
    Click Element    //input[@type='search']
    Input Text    //input[@type='search']    Denmark
    Comment    Click Button
    Comment    Select All From List    id:msdd
    Select From List By Value    yearbox    1992
    Comment    Select From List By Value    Month    January
    Select From List By Value    daybox    15
    Select From List By Index    //select [contains(@placeholder,'Month')]    1
    Input Password    //input[@id='firstpassword']    ABC
    Input Password    //input[@id='secondpassword']    ABC
    Click Button    //button[@id='submitbtn']

TC03_Handlewindow
    Depends On Test    TC01_Registration
    Page Should Contain Element    //a[normalize-space()='SwitchTo']
    Click Element    //a[normalize-space()='SwitchTo']
    Page Should Contain Link    //a[normalize-space()='Windows']
    Click Element    //a[normalize-space()='Windows']
    Page Should Contain Button    //a//button[normalize-space()='click']
    Click Element    //a//button[normalize-space()='click']\n
    ${windows}    Get Window Handles
    Switch Window    title=Selenium
    Comment    @{titles}    Get Window Handles
    Comment    Comment    FOR    ${value}    IN    @{titles}
    Comment    Log    ${value}
    Comment    Selenium2Library.Switch Window
    Comment    ${value}=    SeleniumLibrary.Get WebElement    Selenium

TC04_Interactionspage

*** Keywords ***
