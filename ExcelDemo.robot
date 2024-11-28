*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot

*** Variables ***
${count}          \
${var1}           \

*** Test Cases ***
Excel_TC01

ReadExcelDemo
    Open Excel Document    Demo.xlsx    Sheet1
    ${count}=    Read Excel Cell    3    3
    @{count}=    Read Excel Column    3
    FOR    ${var1}    IN    @{count1}
        LOG    ${var1}
        END
    @{count1}    Get Sheet
    ${var1}=    Read Excel Row    4    4    8    Sheet1

OpenExcel
    ${var1}    Create Excel Document    Sheet1
    # Write Excel Cell \ \ \ 2 \ \ \ 2 \ \ \ XYZ \ \ \ Sheet1
    ${var1}    Create Excel Document    Sheet2
