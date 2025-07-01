*** Settings ***
Library           SeleniumLibrary
#Resource    ../Data/AutomatedInputData.robot

#*** Variables ***
#${NavCache_pageLoadText_navcache}             Removes Content from Asia NavCache /var/navdb/navcache
#${NavCache_deactivationButton_navcache}       css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
#${NavCache_verificationText_navcache}         Output of /opt/gem/scripts/ClearNavCache.sh:

*** Keywords ***

ClearNavCache
    [Documentation]    clear navcache
    wait until page contains           ${NavCache_pageLoadText_navcache}
    click button                       ${NavCache_deactivationButton_navcache}
    VerifySuccessfulDeactivation

VerifySuccessfulDeactivation
    wait until page contains        ${NavCache_verificationText_navcache}
