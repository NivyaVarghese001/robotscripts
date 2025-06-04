*** Settings ***
Documentation    This file contains the main keywords for the test suite
Resource    ./PO/FrontOffice.LandingPage.robot
Resource    ./PO/FrontOffice.TeamPage.robot
Resource    ./PO/FrontOffice.TopNav.robot


*** Variables ***


*** Keywords ***
Navigate to "Landing" page
    FrontOffice.LandingPage.Load URL
    FrontOffice.LandingPage.VerifyPageLoaded


Navigate to "Team" page
    FrontOffice.TopNav.Select "Team" page
    #FrontOffice.TopNav.Verify Page Loaded

Validate "Team" page
   FrontOffice.TeamPage.Validate page contents
```



