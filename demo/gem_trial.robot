*** Settings ***
Documentation     this is the basic infomation of the test suite
Library           SeleniumLibrary


*** Variables ***

*** Test Cases ***
Login to gem page
    [Documentation]    This is some basic information about the test case
    [Tags]             Smoke
    #Set selenium speed          0.2s
    #Set selenium timeout         10s
    Begin browser
    Enter to login page
    Enlarge browser window
    Click login button
    End browser


*** Keywords ***
Begin browser
    Open Browser       about:blank      chrome

Enter to login page
    Go To   http://10.94.98.170:8888/gem

    wait until page contains    Green Engineering Menu

Enlarge browser window
    Set window position         x=0   y=0
    Set window size             width=1582   height=2582

Click login button
    click button                Please click here to login
    wait until page contains    Green Engineering Menu

End browser
    close browser

