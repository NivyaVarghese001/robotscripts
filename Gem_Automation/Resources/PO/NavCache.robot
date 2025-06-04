*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${pageLoadText_navcache}             Removes Content from Asia NavCache /var/navdb/navcache
${deactivationButton_navcache}       css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
${verificationText_navcache}         Output of /opt/gem/scripts/ClearNavCache.sh:

*** Keywords ***

ClearNavCache
    [Documentation]    clear navcache
    wait until page contains           ${pageLoadText_navcache}
    click button                       ${deactivationButton_navcache}
    VerifySuccessfulDeactivation

VerifySuccessfulDeactivation
    wait until page contains        ${verificationText_navcache}
