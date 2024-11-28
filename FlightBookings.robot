*** Settings ***
Library           SeleniumLibrary
Resource          CommnlyUsedKeywords.robot
Library           DependencyLibrary

*** Test Cases ***
TC01_SearchFlights
    OpenBrowser
    Maximize Browser Window
    FlightSearchPageValidation
    Userflightsearch

TC02_Filluserdetails
    Depends On Test    TC01_SearchFlights
    Filluserdetails
    BookingConfirmation

*** Keywords ***
OpenBrowser
    SeleniumLibrary.Open Browser    https://blazedemo.com/index.php    Edge
