*** Settings ***
# /gem/debugging page actvities are define here
Library         SeleniumLibrary

*** Variables ***
${Verify_page_loaded}    /debugging
${css_reset}            css=body > div.ui-page.ui-page-theme-a.ui-page-footer-fixed.ui-page-active > div.ui-content > button:nth-child(17)
${verification_message}    xpath=/html/body/div[3]/div[2]/div/span[1]/text()

*** Keywords ***

ActiveResetWithPersistance

    wait until page contains    ${Verify_page_loaded}
    Scroll To Bottom
    sleep    2s
    click button                ${css_reset}
    #wait until page contains    ${verification_message}


Scroll To Bottom
    ${last_height}=    Execute JavaScript    return document.documentElement.scrollHeight
    FOR    ${index}    IN RANGE    20
        Execute JavaScript    window.scrollTo(0, document.documentElement.scrollHeight)
        Sleep    2s
        ${new_height}=    Execute JavaScript    return document.documentElement.scrollHeight
        Exit For Loop If    ${new_height} == ${last_height}
        ${last_height}=    Set Variable    ${new_height}
    END