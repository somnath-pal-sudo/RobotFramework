*** Settings ***
Library           Myfile.py
Library           jointwostring.py
Library           xlfile.py

*** Test Cases ***
TC_01

    ${var1}    Join Two String    Somnath    pal
    log    ${var1}

TC02_Excel
    xlfile.Addsheet    C:\\Users\\sp7379\\Robot_Project\\Demo\\Demo.xlsx    Sheet2
