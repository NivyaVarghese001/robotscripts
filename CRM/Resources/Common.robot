*** Settings ***
Documentation     This is a common settings file for all tests
Library  SeleniumLibrary

*** Keywords ***
Begin web test
#initialize Selenium
    #Set Selenium Speed      0.2s
    Set Selenium timeout    10s
    open browser            about:blank        ${BROWSER}
    # Resize Browser window for recording
    set window position          x=1    y=1
    Set window size             width=1935    height=1090


End web test
    close all browsers