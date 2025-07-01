*** Settings ***
#documentation    : This is a test suite for the example application.
#robot -d Results -v TARGET_IP:10.94.98.42 .\Tests\learning.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/GemPage.robot
Resource    ../Data/AutomatedInputData.robot
test setup    Begin web test
test teardown    End web test



*** Test Cases ***
VerifyODPApprovalEU
    [Documentation]    Verify that the ODP APPROVAL EU text is present in the input field.
    GemPage.Open        ${URL_BackendSettings}
    sleep               2s
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    3s
    Verify_Input_Value  ${backendSettings_ODPApproval_locator}   ${backendSettings_ODPApproval_text}

*** Keywords ***

Verify_Input_Value
    [Documentation]    Verify the value of an input tag matches the expected text.
    [Arguments]    ${input_locator}    ${expected_text}
    ${actual_value}=    Get Element Attribute    ${input_locator}    value
    log to console    Actual value of input: ${actual_value}
    Run Keyword If    '${actual_value}' != '${expected_text}'    Fail    Expected "${expected_text}" but found "${actual_value}".
    Log    Input value "${actual_value}" matches the expected text.
