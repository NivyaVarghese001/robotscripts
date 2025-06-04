*** Settings ***
Documentation    This file contains the main keywords for the test suite
Resource    ./PO/BackOffice.LandingPage.robot
Resource    ./PO/BackOffice.TopNav.robot


*** Variables ***


*** Keywords ***
Navigate to "Landing" page
   BackOffice.LandingPage.Load URL
    #LandingPage.VerifyPageLoaded
```



