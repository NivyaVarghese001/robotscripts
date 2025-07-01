*** Settings ***
Library  Selenium2Library

*** Variables ***

*** Keywords ***
Begin Web Test
    open browser    about:blank  ${BROWSER}
    #Maximize Browser Window

End Web Test
    close all browsers