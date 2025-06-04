*** Settings ***
Documentation     This is a test suite for the SeleniumLibrary
Library           SeleniumLibrary

# to run script  robot -d ../Results .\login_V2.robot
# THIS TESTCASE IS MODIFIED TO REFACTOR THE ACTUAL CODE IN A BETTER WAY.
Resource   ../Resources/Common.robot
Resource   ../Resources/CrmApp.robot
Test Setup    Begin web test
Test Teardown    End web test

*** Variables ***
${BROWSER}       chrome
${URL}           https://automationplayground.com/crm/
${USERNAME}      admin@robotframeworktutorial.com
${PASSWORD}      admin123

*** Test Cases ***
Should be able to add new customer
    [Documentation]    This is a test case for adding new customer
    [Tags]             1006     Smoke   Contacts

    CrmApp.Go to "Home" Page

# sign In


    click link                  id =SignIn
    wait until page contains    Login

    input text                  id=email-id    ${USERNAME}
    input text                  id=password    ${PASSWORD}
    click button                id=submit-id
    wait until page contains    Our Happy Customers

    # Add Customer
    click Link                  id=new-customer
    wait until page contains    Add Customer

    input text                  id=EmailAddress      jonedoe@gmail.com
    input text                  id=FirstName        Jone
    input text                  id=LastName         Doe
    input text                  id=City             Dallas
    select from list by value    id=StateOrRegion    TX
    select radio button          gender              female
    select checkbox              name=promos-name
    click button                 Submit
    wait until page contains     Success! New customer added.

    # Sign out
    click link                   Sign Out
    wait until page contains     Signed Out



*** Keywords ***

