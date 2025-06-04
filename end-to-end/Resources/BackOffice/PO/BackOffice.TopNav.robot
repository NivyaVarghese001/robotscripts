*** Settings ***
Documentation     This file for defining Top Nav for landing page.
Library           SeleniumLibrary

*** Variables ***
${Team_selector}    css=#bs-example-navbar-collapse-1 > ul > li:nth-child(5) > a

*** Keywords ***
Select "Team" page
   # click link    Team
   click element    ${Team_selector}
   sleep    3s
