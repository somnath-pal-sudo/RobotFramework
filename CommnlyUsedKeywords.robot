*** Settings ***
Library           SeleniumLibrary
Library           DatabaseLibrary
Variables         ../PaymentData.yaml
Library           Collections
Library           String
Library           Screenshot

*** Variables ***
${LoginMail}      pall.somnath@gmail.com
@{count1}

${text1}          \
${text2}          \
@{cities}
${city}           Kolkata Delhi

${response}       Kolkata Delhi

${URL}            http://blazedemo.com/

${destinationcity}    Paris
${Departurecity}    Buenos Aires

${i}              \
${product_id}     \
${declaracion_status}    \
${row_num}        \

${cell}           \

${tableheader}    \

${element}        \
${list}           \
${value}          \

${amoutString}    Account Number : 1004 , Balance : 4801 , Currency : Dollar
${item}           \

*** Keywords ***
LogintoGmail
    [Arguments]    ${useremail}
    Input Text    //input[@type='email']    ${LoginMail}
    Click Element    //*[@id="identifierNext"]/div/button/span

objectsonpage
    Element Text Should Be    //*[@id="account-attributes-challenge"]/h2    Create a Yahoo account
    Page Should Contain Element    //input[@id='usernamereg-firstName'][1]    First name
    Page Should Contain Element    //input[@id='usernamereg-lastName'][1]    Last name
    Page Should Contain Element    //input[@type='email']    Email
    Page Should Contain Element    //input[@type='tel']    Birth year

Defaultnameandmailanddob
    Element Attribute Value Should Be    //input[@id='usernamereg-firstName'][1]    value    '" "'
    Element Attribute Value Should Be    //input[@id='usernamereg-firstName'][1]    value    '" "'
    Element Attribute Value Should Be    //input[@type='email']    value    '" "'
    Element Attribute Value Should Be    //input[@type='tel']    value    '" "'

Emptydetails
    Wait Until Keyword Succeeds    2    1    Element Should Be Visible    //input[@id='usernamereg-firstName'][1]
    Wait Until Keyword Succeeds    2    1    Element Should Be Visible    //input[@id='usernamereg-lastName'][1]
    Wait Until Keyword Succeeds    2    1    Input Text    //input[@type='email']    pall.somnath2@yahoomail.com
    Wait Until Keyword Succeeds    2    1    Input Text    //input[@type='tel']    1994
    Wait Until Keyword Succeeds    2    1    Click Element    //button[@name='signup']
    ${text1}    Get Text    //*[@id="reg-error-email"]
    Run Keyword If    '${text1}'=='This is required'    Log    ${text1}

Loginnavigatetourl
    Open Browser    https://login.yahoo.com/account/create?intl=us&specId=usernameregsimplified&done=https%3A%2F%2Fwww.yahoo.com    Edge

InvalidmailFormat
    Wait Until Keyword Succeeds    3    2    Input Text    //input[@name='username']    pall.somnath2@gmail.com
    Wait Until Keyword Succeeds    3    2    Click Element    //input[@type='submit']
    ${text2}    Get Text    //p[@role='alert']
    Run Keyword If    '${text2}' == 'Sorry,we don't recognize this email.'    Log    ${text2}

Validationonmagaebooking
    Click Element    //*[@id="FromSector_show"]
    Wait Until Keyword Succeeds    2    3    Page Should Contain Element    //*[@class='autosearch fromsectr']
    Click Element    //input[@id='Editbox13_show']
    Wait Until Keyword Succeeds    2    3    Page Should Contain Element    //*[@id="a_Editbox13_show"]
    Click Element    //*[@id='ddate']
    Wait Until Keyword Succeeds    2    3    Page Should Contain Element    //*[@id='ddate']
    Click Element    //*[@id="snd_6_14/12/2024"]
    Click Element    //div[@id='trvlr_colm']
    Wait Until Keyword Succeeds    2    3    Page Should Contain Element    //div[@id='trvlr_colm']
    Comment    Click Element    //*[@id="divSearchFlight"]/button
    Comment    Wait Until Keyword Succeeds    2    3    Page Should Contain Element    //*[@id="divSearchFlight"]/button

validateFromCity
    Click Element    //*[@id="FromSector_show"]\n
    sleep    2
    Element Should Be Visible    //*[@id="fromautoFill_in"]/div[1]
    Scroll Element Into View    css:#fromautoFill > ul
    Page Should Contain List    css:#fromautoFill > ul
    Comment    @{cities}    Get List Items    css:#fromautoFill > ul
    Comment    FOR    ${city}    IN    @{cities}
    Comment    \    Should Contain    ${city}    PASS
    List Selection Should Be
    Select All From List    css:#fromautoFill > ul    1
    Select From List By Index
    Select From List By Label
    Select From List By Value
    Select Checkbox    //*[@id="divFamilyFare"]/ul/li[2]/label
    Select Radio Button
    Radio Button Should Be Set To
    Click Image    //*[@id="spnFlgImgHead"]/img

validatetocity
    @{cities}    Get List Items    //*[@id="toautoFill_in"]
    FOR    ${city}    IN    @{cities}
        Log    ${city}

checkboxvalidation
    Radio Button Should Not Be Selected    optLang
    Select Checkbox
    Set Selenium Timeout
    Wait Until Element Contains
    Set Selenium Implicit Wait
    Set Action Chain Delay

DatabaseQuery
    Connect To Database    pymsql    TestDB
    @{QueryResults}    Query    select * from tab
    Log Many
    Row Count
    Table Must Exist
    Check If Exists In Database    select * from db where col1=''''
    ${count}    Row Count    select * from tab
    @{var3}    Convert To String    @{QueryResults}

FlightSearchPageValidation
    Page Should Contain    Choose your departure city:
    Page Should Contain    Choose your destination city:
    Page Should Contain    Welcome to the Simple Travel Agency!
    Page Should Contain Link    //p//a[text()='destination of the week! The Beach!']
    Page Should Contain Element    //input[@type='submit']
    Page Should Contain Link    //a[text()='Travel The World']
    Page Should Contain Link    //a[text()='home']

Userflightsearch
    Select From List By Label    //select[contains(@name,'fromPort')]    ${destinationcity}
    Select From List By Label    //select[contains(@name,'toPort')]    ${Departurecity}
    Comment    Wait Until Element Contains    //input[@type='submit']\n    Find Flights
    Click Element    //input[@type='submit']
    Page Should Contain    Flights from Paris to Buenos Aires:
    ${AllElements}=    Get WebElements    //table/tbody/tr[1]
    Should Not Be Empty    ${AllElements}=
    Click Element    //tbody/tr[1]/td[1]/input[1]
    Page Should Contain    Your flight from TLV to SFO has been reserved.

Filluserdetails
    Page Should Contain Textfield    //input[contains(@id,'inputName')]
    Input Text    //input[contains(@id,'inputName')]    Somnath
    Page Should Contain Textfield    //input[contains(@placeholder,'123 Main St.')]
    Input Text    //input[contains(@placeholder,'123 Main St.')]    UK,London
    Page Should Contain Textfield    //input[contains(@placeholder,'Anytown')]
    Input Text    //input[contains(@placeholder,'Anytown')]    London
    Select From List By Label    //select[@id='cardType']    American Express
    Page Should Contain Checkbox    //input[@id='rememberMe']
    Select Checkbox    //input[@id='rememberMe']
    Click Element    //input[@value='Purchase Flight']

BookingConfirmation
    Page Should Contain    PendingCapture
    Comment    Page Should Contain    Sat, 23 Nov 2024 10:41:27 +0000

Validate pagecomponents
    Page Should Contain Link    //a[text()='Sign In']
    Page Should Contain Link    //*[@id="MenuContent"]/a[1]
    Page Should Contain Link    //*[@id="MenuContent"]/a[3]
    Page Should Contain Image    //img[contains(@src,'../images/logo-topbar.svg')]
    Page Should Contain Button    //input[contains(@value,'Search')]
    Page Should Contain Image    //img[contains(@src,'./images/sm_fish.gif')]
    Page Should Contain Image    //img[contains(@src,'../images/sm_dogs.gif')]
    Comment    Page Should Contain Link    //*[@id="QuickLinks"]/img[3]\n
    Page Should Contain Image    //img[@usemap='#estoremap']

petstoreSignin
    Click Link    //a[text()='Sign In']
    Page Should Contain    Please enter your username and password.
    Page Should Contain Link    //a[text()='Register Now!']
    Page Should Contain    Username:
    Page Should Contain    Password:
    Input Text    //input[contains(@name,'username')]    somnath
    Input Password    //input[contains(@name,'password')]    somnath
    Click Element    //input[contains(@value,'Login')]

pageoperationpetstore
    Page Should Contain Image    //img[contains(@src,'../images/fish_icon.gif')]
    Page Should Contain Element    //div[@id='SidebarContent']
    Click Image    //img[contains(@src,'../images/fish_icon.gif')]
    Comment    @{AllFish}=    Get WebElements    //*[@id="Catalog"]/table
    Comment    FOR    ${text1}    IN    @{AllFish}=
    ${data}    Get Text    //*[@id="Catalog"]/table/tbody/tr[2]/td[1]/a
    ${column}    Get Element Count    //table/tbody/tr/th
    ${rows}    Get Element Count    //table/tbody/tr
    Comment    Table Row Should Contain    //table/tbody/tr    5
    Table Column Should Contain    //table/tbody/tr/th[1]    1    Product ID
    Table Column Should Contain    //table/tbody/tr/th[2]    2    Name
    Comment    ${rowcount}    Evaluate    ${i}+5
    Comment    ${value}    Get Text    //*[@id='Catalog']/table/tbody/tr
    Comment    Table Cell Should Contain    //*[@id='Catalog']/table/tbody/tr    ${rowcount}    ${product_id}    1
    Comment    IF    ${value}==${true}
        Comment    ${declaracion_status}    Run Keyword And Return Status    Table Cell Should Contain    //*[@id='Catalog']/table/tbody/tr    ${rowcount}    FI-SW-01    Angelfish
    Comment    END
    Comment    ${tablecell}    Get Table Cell    //*[@id="Catalog"]/table    2    2
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    2    2    Angelfish
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    3    2    Tiger Shark
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    4    2    Koi
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    5    2    Goldfish
    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    @{cells}=    Get WebElements    //table/tbody/tr[${row_num}]
    END
    ${data}=    Create List
    FOR    ${cell}    IN    @{cells}
    sleep    3s
    Wait Until Element Is Visible    ${cell}
    ${text}=    Get Element Attribute    ${cell}    innerText
    ${data}=    Evaluate    [cell.text for cell in $cells]
    Log    ${cell} contains text: ${text}
    END
    Page Should Contain Link    //a[text()='Return to Main Menu']
    Page Should Contain Link    //a[text()='FI-SW-01']
    Click Link    //a[text()='FI-SW-01']
    Page Should Contain    Angelfish
    Page Should Contain Link    //a[text()='Sign Out']
    Page Should Contain Link    //a[text()='My Account']

SpecificPageOperation
    ${column}    Get Element Count    //table/tbody/tr/th
    ${rows}    Get Element Count    //table/tbody/tr
    Table Column Should Contain    //table/tbody/tr/th[1]    1    Item ID
    Table Column Should Contain    //table/tbody/tr/th[2]    2    Product ID
    Table Column Should Contain    //table/tbody/tr/th[4]    4    List Price
    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    @{cells}=    Get WebElements    //table/tbody/tr[${row_num}]
    END
    ${data}=    Create List
    FOR    ${cell}    IN    @{cells}
    sleep    3s
    Wait Until Element Is Visible    ${cell}
    ${text}=    Get Element Attribute    ${cell}    innerText
    ${data}=    Evaluate    [cell.text for cell in $cells]
    Log To Console    ${cell} contains text: ${text}
    END
    Click Link    //a[text()='EST-1']
    Page Should Contain Image    //img[contains(@src,'../images/fish1.gif')]
    Page Should Contain Element    //b[normalize-space()='Large Angelfish']
    Page Should Contain Link    //a[text()='Add to Cart']
    Click Link    //a[text()='Add to Cart']

ShoppingKartValidation
    Page Should Contain    Shopping Cart
    ${cols}    Get Element Count    //*[@id="Cart"]/form/table/tbody/tr/th
    ${rows}    Get Element Count    //*[@id="Cart"]/form/table/tbody/tr
    Table Column Should Contain    //table/tbody/tr/th[1]    1    Item ID
    Table Column Should Contain    //table/tbody/tr/th[2]    2    Product ID
    Table Column Should Contain    //table/tbody/tr/th[4]    4    In Stock?
    Table Column Should Contain    //table/tbody/tr/th[5]    5    Quantity
    Table Column Should Contain    //table/tbody/tr/th[6]    6    List Price
    Table Column Should Contain    //table/tbody/tr/th[7]    7    Total Cost
    Page Should Contain Element    //td//a[text()='Remove']    limit=1
    Comment    Page Should Contain Element    //tbody/tr[3]/td[8]/a[1]
    Page Should Contain Element    //input[@value='Update Cart']
    Page Should Contain Link    //a[text()='Proceed to Checkout']
    Input Text    //input[@name='EST-1']    10
    Click Element    //a[text()='Proceed to Checkout']

verifypaymentpage
    Page Should Contain    Payment Details
    Page Should Contain    Billing Address
    Select From List By Label    //*[@id="Catalog"]/form/table/tbody/tr[2]/td[2]/select    American Express
    Input Text    //input[contains(@name,'order.creditCard')]    999 9999 9999 9999
    Input Text    //input[contains(@name,'order.expiryDate')]    09/2019
    Input Text    //input[contains(@name,'order.billToFirstName')]    Somnath
    Input Text    //input[contains(@name,'order.billToLastName')]    Pal
    Comment    Select Checkbox    //input[contains(@type,'checkbox')]
    Comment    Click Element    //input[contains(@name,'newOrder')]
    Click Element    //input[@value='Continue']

PaymentConfirmation
    ${tableheader}    Get Text    //*[@id="Catalog"]/table/tbody/tr[2]/th
    Run Keyword If    ' ${tableheader}'=='Billing Address'    Log    ${tableheader}
    ${tableheader}    Get Text    //*[@id="Catalog"]/table/tbody/tr[11]/th
    Run Keyword If    '${tableheader}'=='Shipping Address'    Log Title
    Comment    Wait Until Keyword Succeeds    2    2    Table Header Should Contain    //*[@id="Catalog"]/table/tbody/tr[2]/th    Billing Address
    Comment    Page Should Contain
    ${rows}    Get Element Count    //table/tbody/tr
    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    @{cells}=    Get WebElements    //table/tbody/tr[${row_num}]
    END
    ${data}=    Create List
    FOR    ${cell}    IN    @{cells}
    sleep    3s
    Wait Until Element Is Visible    ${cell}
    ${text}=    Get Element Attribute    ${cell}    innerText
    ${data}=    Evaluate    [cell.text for cell in $cells]
    Log To Console    ${cell} contains text: ${text}
    END
    Click Link    //a[normalize-space()='Confirm']
    Page Should Contain    Thank you, your order has been submitted.
    Table Row Should Contain    //*[@id="Catalog"]//table    1    Order #
    Table Row Should Contain    //*[@id="Catalog"]//table    2    Payment Details
    Comment    ${data}    Get Text    //*[@id="Catalog"]/table/tbody/tr[3]/td[2]
    Comment    ${text1}    Table Cell Should Contain    //*[@id="Catalog"]//table    3    1    Card Type
    Comment    Run Keyword If
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    4    2    999 9999 9999 9999 * Fake number!
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    5    2    12/03
    Comment    Table Cell Should Contain    //*[@id="Catalog"]//table    7    1    somnath
    ${rows}    Get Element Count    //table/tbody/tr
    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    @{cells}=    Get WebElements    //table/tbody/tr[${row_num}]
    END
    ${data}=    Create List
    FOR    ${cell}    IN    @{cells}
    sleep    3s
    Wait Until Element Is Visible    ${cell}
    ${text}=    Get Element Attribute    ${cell}    innerText
    ${data}=    Evaluate    [cell.text for cell in $cells]
    Log To Console    ${cell} contains text: ${text}
    END
    Log    Row ${row_num} data: ${data}
    Comment    &{paymentdetails}    Card Type:Visa    Card Number:999 9999 9999 9999 * Fake number!    Expiry Date (MM/YYYY):12/03
    Comment    @{all_data}    ${paymentdetails}
    Comment    FOR    ${data}    IN    &{paymentinfo}
    Comment    Log    Details for ${data.Card Type}
    Comment    END
    Comment    ${dict2} =    Get List Items    //table/tbody/tr
    @{list}    Get WebElements    //*[@id="Catalog"]/table/tbody
    FOR    ${element}    IN    @{list}
    ${text}=    Get Text    ${element}
    Append To List    ${list}    ${text}
    END
    FOR    ${value}    IN    @{list}
    Log To Console    ${value}
    END
    Page Should Contain Link    //div//a[text()='EST-1']

Bank_CustomerLogin
    Click Button    //*[text()[contains(.,'Customer Login')]]
    sleep    5s
    Page Should Contain Element    //select[contains(@name,'userSelect')]
    Select From List By Index    //select[contains(@id,'userSelect')]    2
    Click Button    //*[text()[contains(.,'Login')]]
    sleep    2s
    Page Should Contain    Welcome Harry Potter !!
    ${txn_list}=    Get WebElements    //select[contains(@name,'accountSelect')]
    Log To Console    ${txn_list}
    Select From List By Index    //select[contains(@name,'accountSelect')]    1
    Sleep    2s
    Comment    Page Should Contain    //div[@ng-hide='noAccount'][2]
    ${line}=    Get Line    Account Number : 1004 , Balance : 111 , Currency : Dollar    0
    ${buttonlist}    Create List    Transactions    Deposit    Withdrawl
    FOR    ${button}    IN    ${buttonlist}
    ${button}=    Get From List    ${buttonlist}    0
    ${button}=    Get From List    ${buttonlist}    1
    ${button}=    Get From List    ${buttonlist}    2
    END
    Click Button    //button[@ng-class='btnClass1']
    sleep    2s

CustomerTxn
    Page Should Contain Button    //*[text()[contains(.,'Back')]]
    Page Should Contain Button    //*[text()[contains(.,'Reset')]]
    Page Should Contain Element    //div[@ng-show='showDate']//input[contains(@id,'start')]
    Page Should Contain Element    //div[@ng-show='showDate']//input[contains(@id,'end')]
    ${column}    Get Element Count    //table[contains(@class,'table table-bordered table-striped')]/thead
    ${rows}    Get Element Count    //table[contains(@class,'table table-bordered table-striped')]/tbody/tr
    Table Column Should Contain    //table[contains(@class,'table table-bordered table-striped')]/thead    1    Date-Time
    Table Column Should Contain    //table[contains(@class,'table table-bordered table-striped')]/thead    2    Amount
    Table Column Should Contain    //table[contains(@class,'table table-bordered table-striped')]/thead    3    Transaction Type
    Comment    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    Comment    @{cells}=    Get WebElements    //table[contains(@class,'table table-bordered table-striped')]/tbody/tr[${row_num}]
    Comment    END
    Comment    ${data}=    Create List
    Comment    FOR    ${cell}    IN    @{cells}
    Comment    sleep    3s
    Comment    Wait Until Element Is Visible    ${cell}
    Comment    ${text}=    Get Element Attribute    ${cell}    innerText
    Comment    ${data}=    Evaluate    [cell.text for cell in $cells]
    Comment    Log To Console    ${cell} contains text: ${text}
    Comment    END
    Click Element    //*[text()[contains(.,'Back')]]
    Click Element    //button[contains(@ng-class,'btnClass2')]
    sleep    2s
    Page Should Contain    Amount to be Deposited :
    Input Text    //input[contains(@type,'number')]    5000
    Mouse Up    //input[@placeholder='amount']
    Click Element    //button[@type='submit']
    Page Should Contain    Deposit Successful
    Set Selenium Implicit Wait    2s
    Click Element    //button[contains(@ng-class,'btnClass3')]
    Page Should Contain    Amount to be Withdrawn :
    Input Text    //input[contains(@type,'number')]    2000
    Click Element    //button[@type='submit']
    Page Should Contain    Transaction successful
    ${line}=    Get Line    ${amoutString}    0
    Click Element    //button[contains(@ng-class,'btnClass1')]
    Comment    FOR    ${row_num}    IN RANGE    1    ${rows+1}
    Comment    @{cells}=    Get WebElements    //table[contains(@class,'table table-bordered table-striped')]/tbody/tr[${row_num}]
    Comment    END
    Comment    ${data}=    Create List
    Comment    FOR    ${cell}    IN    @{cells}
    Comment    sleep    3s
    Comment    Wait Until Element Is Visible    ${cell}
    Comment    ${text}=    Get Element Attribute    ${cell}    innerText
    Comment    ${data}=    Evaluate    [cell.text for cell in $cells]
    Comment    Log To Console    ${cell} contains text: ${text}
    Comment    END

OnlinemktPageValidation
    Page Should Contain Link    //a[contains(@class,'logo')]
    Page Should Contain Element    //input[contains(@id,'search')]
    Page Should Contain Link    //div[@class='panel header']//a[contains(text(),'Sign In')]
    Page Should Contain Link    //div[@class='panel header']//a[contains(text(),'Create an Account')]
    ${items}=    Get WebElements    //ul[@id='ui-id-2']
    FOR    ${item}    IN    ${items}
    Log List    ${items}
    END
    Comment    Page Should Contain List    ${items}
    Page Should Contain Link    //a[contains(@class,'action showcart')]

CustomerLogin_mkt
    Click Element    //div[@class='panel header']//a[contains(text(),'Sign In')]
    Page Should Contain    Customer Login
    input text    //input[@name='login[username]']    pal.somnath2@rediffmail.com
    input text    //input[@name='login[password]']    somnathpal@11
    Click Element    //fieldset[@class='fieldset login']//span[contains(text(),'Sign In')]
        Comment    //div[@class='panel header']//span[@class='logged-in'][normalize-space()='Welcome, somnath pal!']
    Page Should Contain    Welcome, somnath pal!



Forgotpassword-user
    Click Element    //fieldset[@class='fieldset login']//span[contains(text(),'Forgot Your Password?')]
    ${window_name}    Get Window Titles
    ${windows}=    Get Window Handles
    Switch Window    ${windows}[0]
    ${window_name}    Get Window Titles

UserProductSelection
    Page Should Contain Element    //li[contains(@class,'product-item')][1]
    Page Should Contain Element    //div[contains(@data-role,'swatch-option-1556')]
    Page Should Contain    Hot Sellers
    ${all_products}=    Get WebElements    //div[contains(@class,'products-grid grid')]
    FOR    ${item-prod}    IN    ${all_products}
    Log    ${item-prod}
    END
    Click Element    //div[@class='swatch-opt-1556']//div[@id='option-label-size-143-item-166']
    Click Element    //div[@option-label='Orange']
    Mouse Over    //div[@class='swatch-opt-1556']//div[@aria-label='Size']
    Comment    Click Element    dom:document.querySelector("body > div:nth-child(8)").shadowRoot.querySelector("#ft-reg-bubble > div > div.ft-reg-controls")
    Click Element    //div[@class='swatch-opt-1556']//div[@id='option-label-size-143-item-166']
    Set Selenium Implicit Wait    5s
    Click Element    //form[@data-role='tocart-form'and @data-product-sku='WS12']//button
    Click Element    //div[@aria-label='Next']//div[@class='fotorama__arr__arr']
    Page Should Contain    $22.00
    Click Element    //div[@class='swatch-option text' and @id='option-label-size-143-item-166']
    Click Element    //div[@class='swatch-option color' and @id='option-label-color-93-item-50']
    Page Should Contain    Radiant Tee
    Input Text    //input[@class='input-text qty']    20
    Click Element    //a[@class='action towishlist']
    Page Should Contain    My Wish List
    Page Should Contain Element    //div[@class='products-grid wishlist']
    Click Element    //div[@class='minicart-wrapper active']
    Click Element    //button[@id='top-cart-btn-checkout']
    Page Should Contain    Shipping
    Page Should Contain    Shipping Address

NavigationSelection
