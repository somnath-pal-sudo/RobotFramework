*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot
Resource          FlightTestdata.robot.txt

*** Test Cases ***
TC_01_ManageBooking
    Open Browser    https://www.easemytrip.com/?utm_source=bing&utm_medium=cpc&utm_campaign=418007978&utm_content=1161085019078822&utm_term=easemytrip&adgroupid=1161085019078822&msclkid=d672a74f5dd5134a78cdc075b15a84a7&utm_source=bing&utm_medium=cpc&utm_campaign=Brand%20(EaseMy%20Trip.Com%20New)_USA&utm_term=easemytrip&utm_content=EaseMyTrip%20Exact    Edge
    Maximize Browser Window
    Validationonmagaebooking
    validateFromCity
