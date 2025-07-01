*** Settings ***
#documentation    : This is a test suite for the example application.
Library    SeleniumLibrary
#Resource    ../Data/AutomatedInputData.robot

#*** Variables ***
#${NavHttps_pageLoadText}             deactivate verify http backend
#${NavHttps_deactivationButton}        css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
#${NavHttps_verificationText}          verifyHttpBackend in /opt/navigation/etc/navconn_config.json deactivated.
*** Keywords ***

DeactivateHTTPbackend
    [Documentation]    Deactivate the HTTP backend
    wait until page contains           ${NavHttps_pageLoadText}
    click button                       ${NavHttps_deactivationButton}
    VerifySuccessfulDeactivation

VerifySuccessfulDeactivation
    wait until page contains        ${NavHttps_verificationText}






