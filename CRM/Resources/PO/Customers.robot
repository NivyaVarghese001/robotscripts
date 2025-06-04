*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Successful "Login_Page" Header}       Our Happy Customers
*** Keywords ***
Verify Page Loaded
    wait until page contains   ${Successful "Login_Page" Header}