*** Settings ***
#documentation    : This is a test suite for the example application.
Library    SeleniumLibrary

*** Variables ***
${pageLoadText}             deactivate verify http backend
${deactivationButton}        css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
${verificationText}          verifyHttpBackend in /opt/navigation/etc/navconn_config.json deactivated.
*** Keywords ***

DeactivateHTTPbackend
    [Documentation]    Deactivate the HTTP backend
    wait until page contains           ${pageLoadText}
    click button                       ${deactivationButton}
    VerifySuccessfulDeactivation

VerifySuccessfulDeactivation
    wait until page contains        ${verificationText}






