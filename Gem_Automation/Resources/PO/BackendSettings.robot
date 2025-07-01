*** Settings ***
Library         SeleniumLibrary


*** Keywords ***

SetAudiBackEnd
    input text      ${backendSettings_audibackend_locator}     ${backendSettings_audi_backend}
    sleep    2

DeactivateComponentProtection
    Click Element    ${backendSettings_component_protection_flipbutton}
    ${current_class}=    Get Element Attribute    ${backendSettings_component_protection_flipbutton}   class
    Sleep           1s
    Log To Console     flip button value : ${current_class}


    WHILE    '${current_class}' != '${backendSettings_component_protection_off}'

        Click Element    ${backendSettings_component_protection_flipbutton}
        Sleep    1s
        ${current_class}=    Get Element Attribute    ${backendSettings_component_protection_flipbutton}   class
        #Run Keyword If    '${current_class}' == '${off_css_class}'    EXIT   For loop

        Log To Console    Current class of the flip button: ${current_class}
        Sleep    1s
    Log    Flip button is successfully toggled
    END
    Log    Flip button is successfully toggled to the "off" state


DeactivateComponentProtection_withArguments
    [Arguments]    ${flip_button_locator}    ${off_css_class}    ${on_css_class}

    Click Element    ${flip_button_locator}
    ${current_class}=    Get Element Attribute    ${flip_button_locator}    class
    Sleep           1s
    Log To Console     flip button value : ${current_class}


    WHILE    '${current_class}' != '${off_css_class}'

        Click Element    ${flip_button_locator}
        Sleep    1s
        ${current_class}=    Get Element Attribute    ${flip_button_locator}    class
        #Run Keyword If    '${current_class}' == '${off_css_class}'    EXIT   For loop

        Log To Console    Current class of the flip button: ${current_class}
        Sleep    1s
    Log    Flip button is successfully toggled to the "off" state
    END

Verify_text_visible
    [Documentation]    wait until a specific text is visible on webpage
    [Arguments]    ${verification_text}
    wait until page contains    ${verification_text}    timeout=20s
    log     Text    "${verification_text}" is visible on the page

Verify_text_visible_with_debugging
    [Documentation]    Debug and verify if a specific text is visible on the webpage.
    [Arguments]    ${verification_text}
    ${page_source}=    Get Source
    Log    Page Source:\n${page_source}
    Run Keyword If    '${verification_text}' not in '${page_source}'    Log    Text "${verification_text}" not found in page source.
    Wait Until Page Contains    ${verification_text}    timeout=20s
    Log    Text "${verification_text}" is visible on the page

Verify_ODPApproval_Status
    [Documentation]    Verify the ODP Approval Status on the page by checking the value of an input tag matches the expected text.
    [Arguments]      ${input_locator}    ${expected_text}
    wait until page contains element    ${backendSettings_elemement_verify}
    ${actual_value}=    Get Element Attribute    ${input_locator}    value
    log to console    Actual value of input: ${actual_value}
    run keyword if    '${actual_value}' != '${expected_text}'    Fail    Expected "${expected_text}" but found "${actual_value}".
    Log    Input value "${actual_value}" matches the expected text.

Verify_Current_Esobackend_Available
    [Documentation]    Verify if the current Esobackend is available by checking the value of an input tag is not empty.
    [Arguments]      ${input_value_Esoserver}
     wait until page contains element  ${input_value_Esoserver}
    ${actual_value}=    Get Element Attribute    ${input_value_Esoserver}    value
    log to console    Actual value of input: ${actual_value}
    Run Keyword If    '${actual_value}' != 'None'    Fail    log to console    The input value is empty for locator and online is not established: ${input_value_Esoserver}
    Log    Input value "${actual_value}" is not empty.

Verify_Current_realm_available
    [Documentation]    Verify if the current realm is available by checking the value of an input tag is not empty.
    [Arguments]      ${input_locator_current_realm}
    wait until page contains element  ${input_locator_current_realm}
    ${actual_value}=    Get Element Attribute    ${input_locator_current_realm}    value
    log to console    Actual value of input: ${actual_value}
    Run Keyword If     '${actual_value}' != 'None'    Fail   log to console     The input value is empty for locator and online is not established: ${input_locator_current_realm}
    Log    Input value "${actual_value}" is not empty.



