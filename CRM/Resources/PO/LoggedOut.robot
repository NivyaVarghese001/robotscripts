*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SignOutText}          Signed Out
*** Keywords ***
Verify Page Loaded
    wait until page contains    ${SignOutText}



