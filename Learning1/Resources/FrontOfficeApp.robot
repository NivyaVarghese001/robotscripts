*** Settings ***
Documentation    This file contains the main keywords for the test suite
Resource    ./PO/LandingPage.robot
Resource    ./PO/TeamPage.robot
Resource    ./PO/TopNav.robot


*** Variables ***


*** Keywords ***
Navigate to "Landing" page
    LandingPage.Load URL   ${URL}
    LandingPage.VerifyPageLoaded


Navigate to "Team" page
    TopNav.Select "Team" page
    TeamPage.Verify Page Loaded

Validate "Team" page
    TeamPage.Validate page contents
```



