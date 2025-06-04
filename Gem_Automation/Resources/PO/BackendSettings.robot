*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${audi_backend}     14
${audibackend_locator}      xpath=//div[@data-role='content']/div[1]/div/input
${component_protection_flipbutton}=     css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > form:nth-child(6) > div
${component_protection_off}=     ui-flipswitch ui-shadow-inset ui-bar-inherit ui-corner-all
${component_protection_on}=      ui-flipswitch ui-shadow-inset ui-bar-inherit ui-corner-all ui-flipswitch-active
${audibackend_active}=   xpath=//div[@data-role='content']/div[1]/div/input[@value='14']
${ODPApproval_locator}=   css=body > div:nth-child(7) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > input:nth-child(1)


*** Keywords ***

SetAudiBackEnd
    input text      ${audibackend_locator}    ${audi_backend}
    sleep    2

DeactivateComponentProtection
    Click Element    ${component_protection_flipbutton}
    ${current_class}=    Get Element Attribute    ${component_protection_flipbutton}    class
    Sleep           1s
    Log To Console     flip button value : ${current_class}


    WHILE    '${current_class}' != '${component_protection_off}'

        Click Element    ${component_protection_flipbutton}
        Sleep    1s
        ${current_class}=    Get Element Attribute    ${component_protection_flipbutton}    class
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

Verify_ODP_EU_Approval
    wait until page contains    ODPApproval_locator

