*** Settings ***
Documentation     This is a test suite for the SeleniumLibrary
Library           SeleniumLibrary

# to run script  robot -d ../Results .\login_V3.robot
# THIS TESTCASE IS MODIFIED TO REFACTOR THE ACTUAL CODE IN A BETTER WAY.
Resource   ../Resources/Common.robot
Resource   ../Resources/CrmApp.robot
Test Setup    Begin web test
Test Teardown    End web test

*** Variables ***
${BROWSER}       chrome
${URL}           https://automationplayground.com/crm/
${VALID_LOGIN_EMAIL}      admin@robotframeworktutorial.com
${VALID_LOGIN_PASSWORD}      admin123
${CU_EMAIL}             jonedoe@gmail.com
${CU_FIRSTNAME}         Jone
${CU_LASTNAME}          Doe
${CU_CITY}              Dallas
${CU_STATE}             TX
${CU_GENDER}            male

*** Test Cases ***
Should be able to add new customer
    [Documentation]    This is a test case for adding new customer
    [Tags]             1006     Smoke   Contacts

    CrmApp.Go to "Home" Page
    CrmApp."Login" With Valid Credentials   ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    CrmApp.AddCustomers  ${CU_EMAIL}    ${CU_FIRSTNAME}    ${CU_LASTNAME}    ${CU_CITY}    ${CU_STATE}    ${CU_GENDER}
    CrmApp."LogOut" after successful addition of new customer

# sign In


    #click link                  id =SignIn
    #wait until page contains    Login

    #input text                  id=email-id    ${USERNAME}
    #input text                  id=password    ${PASSWORD}
    #click button                id=submit-id
    #wait until page contains    Our Happy Customers

    # Add Customer
    #click Link                  id=new-customer
    #wait until page contains    Add Customer

    #input text                  id=EmailAddress      jonedoe@gmail.com
    #input text                  id=FirstName        Jone
    #input text                  id=LastName         Doe
    #input text                  id=City             Dallas
    #select from list by value    id=StateOrRegion    TX
    #select radio button          gender              female
   # select checkbox              name=promos-name
   # click button                 Submit
   # wait until page contains     Success! New customer added.

    # Sign out
    #click link                   Sign Out
    #wait until page contains     Signed Out




