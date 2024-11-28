*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot

*** Test Cases ***
OpenBrowser
    Open Browser    http://www.google.com    Edge
    Close Browser

TC_01
    Open Browser    https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Faccounts.google.com%2F&followup=https%3A%2F%2Faccounts.google.com%2F&ifkv=AcMMx-fkTscd4PVDOkMmAT_lmzrkf6krUyDmBRWv3Xh8HQH_1o3yzKW2b92kIqeJd_ue_vscPDqI&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S50707042%3A1731746123162678&ddm=1    edge
    sleep    4
    LogintoGmail    pall.somnath2@gmail.com
    Close Browser
