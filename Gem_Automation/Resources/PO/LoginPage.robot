*** Settings ***
#documentation    : This is a test suite for the example application.
Library    SeleniumLibrary
#Resource    ../Data/AutomatedInputData.robot

#*** Variables ***
#${LoginPage_Gem_title}        Green Engineering Menu
#${LoginPage_Button_Login}     css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button


*** Keywords ***
Open
    [Arguments]    ${url}
    go to   ${url}


Verify Page Loaded_Gem
    ${Home_title}    get title
    #log   ${Home_title}
    wait until page contains    ${LoginPage_Gem_title}

Login
    click button        ${LoginPage_Button_Login}


