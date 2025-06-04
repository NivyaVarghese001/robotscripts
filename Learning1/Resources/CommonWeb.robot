*** Settings ***
Documentation    This is common test suite for all tests
Library          SeleniumLibrary

*** Keywords ***
Begin web test
    set selenium timeout    10s   # Set timeout for all selenium operations
    Open Browser    about:blank     ${BROWSER}
    Maximize Browser Window

End web test
    close all browsers   # Close all browsers opened by Selenium
