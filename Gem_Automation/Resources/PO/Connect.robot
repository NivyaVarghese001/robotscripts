*** Settings ***
Library           SeleniumLibrary

*** Keywords ***

VerifyRegistationStatus
    [Documentation]       Verify the car registration status on the page by checking the value of the input tag matches the expected text.
    [Arguments]           ${input_locator}   ${expected_text}
    wait until page contains element   ${input_locator}    timeout=10s
    ${actual_status}=     get text    ${input_locator}
    log to console        Actual value of input: ${actual_status}
    run keyword if        "${actual_status}" != "${expected_text}"    Fail    Expected "${expected_text}" but found "${actual_status}".
    log    Input value "${actual_status}" matches the expected text.


VerifyServiceList
    [Documentation]    Verify the service list on the page by checking the value of the input tag matches the expected text.
    [Arguments]        ${input_locator}   ${expected_text}
    ${actual_service_list}=    get text   ${input_locator}
    log to console        Actual value of input: ${actual_service_list}
    run keyword if        "${actual_service_list}" != "${expected_text}"    Fail    Expected "${expected_text}" but found "${actual_service_list}".
    log    Input value "${actual_service_list}" matches the expected text.

ServicelistUptodate
    [Documentation]    Verify the service list is up to date by checking the value of the input tag matches the expected text.
    [Arguments]        ${input_locator}   ${expected_text}
    ${actual_service_uptodate}=      get text    ${input_locator}
    log to console        Actual value of input: ${actual_service_uptodate}
    run keyword if        "${actual_service_uptodate}" != "${expected_text}"    Fail    Expected "${expected_text}" but found "${actual_service_uptodate}".
    log    Input value "${actual_service_uptodate}" matches the expected text.
