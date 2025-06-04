*** Settings ***
Documentation     This file for defining Page Objects for landing page.
Library           SeleniumLibrary

*** Variables ***
${LANDING_NAVIGATION_ELEMENT} =  id=mainNav


*** Keywords ***
Load URL
    #[Arguments]    ${url}
    go to    ${FrontOffice_URL}

VerifyPageLoaded
    wait until page contains element  ${LANDING_NAVIGATION_ELEMENT}

