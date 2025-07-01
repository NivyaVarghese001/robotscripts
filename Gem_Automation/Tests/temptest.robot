*** Settings ***
Library           SeleniumLibrary
Resource    ../Data/AutomatedInputData.robot

**** Test Cases ***
Open Browser And Navigate
    [Documentation]    Open a browser and navigate to the specified URL.
    Open Browser    http://10.94.98.42:8888/gem/mmx/connect/backendsettings    Chrome
    Maximize Browser Window
    wait until page contains    ${LoginPage_Gem_title}
    sleep    2s
