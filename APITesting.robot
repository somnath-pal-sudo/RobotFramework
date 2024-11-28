*** Settings ***
Library           Collections
Library           requests
Library           DatabaseLibrary
Library           RequestsLibrary

*** Variables ***
${baseurl}        https://reqres.in/

${response}       \
${test}           /trending?geo=US

*** Test Cases ***
TC01_GetRequest
    Comment    Create Session    google    https://jsonplaceholder.typicode.com
    Comment    ${resp_google}=    GET On Session    google    /    expected_status=200
    Comment    ${resp_json}=    GET On Session    jsonplaceholder    /posts/1
    Comment    Should Be Equal As Strings    ${resp_google.reason}     ok
    Comment    Dictionary Should Contain Value    ${resp_json.json()}    sunt aut facere repellat provident

    # ${response}    RequestsLibrary.GET    https://reqres.in/    expected_status=200

    Create Session    mysession    https://trends.google.com    proxies={'https':'sub.proxy.att.com:8080'}
    ${resp_google}=    GET On Session    mysession    ${test}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}
    Log To Console    ${response.headers}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${code}    200
