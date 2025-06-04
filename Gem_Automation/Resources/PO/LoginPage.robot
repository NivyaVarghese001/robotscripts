*** Settings ***
#documentation    : This is a test suite for the example application.
Library    SeleniumLibrary

*** Variables ***
${Gem_title}        Green Engineering Menu
${Button_Login}     css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button


*** Keywords ***
Open
    [Arguments]    ${url}
    go to   ${url}


Verify Page Loaded_Gem
    ${Home_title}    get title
    #log   ${Home_title}
    wait until page contains    ${Gem_title}

Login
    click button        ${Button_Login}


