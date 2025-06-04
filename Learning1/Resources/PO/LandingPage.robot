*** Settings ***
Documentation     This file for defining Page Objects for landing page.
Library           SeleniumLibrary

*** Variables ***
${LANDING_NAVIGATION_ELEMENT} =  id=mainNav


*** Keywords ***
Load URL
    [Arguments]    ${url}
    go to    ${url}

VerifyPageLoaded
    wait until page contains element  ${LANDING_NAVIGATION_ELEMENT}

