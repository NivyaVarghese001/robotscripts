*** Settings ***
#Documentation    gem/mmx/config page keywords are defined here
Library    SeleniumLibrary
#Resource    ../Data/AutomatedInputData.robot

#*** Variables ***
#${ConfigPage_RESET_BUTTON}     css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button:nth-child(1)
#${ConfigPage_Refresh_BUTTON}    css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-footer.ui-bar-inherit.ui-footer-fixed.slideup > div > ul > li.ui-block-c > button
*** Keywords ***

Verify configuration page loaded
    [Documentation]    Verify that the configuration page is loaded by checking the title and URL.
    ${title}=    get text    css=#rFood
    log    ${title} loaded
    Page Should Contain         ${title}

Reset
    click button        ${ConfigPage_RESET_BUTTON}
    Sleep    1s
    click button        ${ConfigPage_Refresh_BUTTON}
    click button        ${ConfigPage_RESET_BUTTON}
    Sleep    2s
    click button        ${ConfigPage_Refresh_BUTTON}
    click button        ${ConfigPage_RESET_BUTTON}
    Sleep    2s
    click button        ${ConfigPage_Refresh_BUTTON}

Page_sync
    [Documentation]    Verify that the configuration page is loaded by checking the title and URL.
    click button        ${ConfigPage_Refresh_BUTTON}
    Sleep    1s



