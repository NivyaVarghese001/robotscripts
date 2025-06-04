*** Settings ***
Documentation     This is a test suite for the SeleniumLibrary
Library           SeleniumLibrary

# to run script  robot -d ../Results .\login_V4.robot
# to run only testcases associated with a single tag robot -d ../Results -i Login .\login_V4.robot
# THIS single test case is splitted in to multiple testcase
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
Should be able to Load Home page
    [Documentation]    This is a test case for loading the home page
    [Tags]             1000     Smoke   Home
    CrmApp.Go to "Home" Page

Should be able to "Login" with valid credentials
      [Documentation]    This is a test case for logging in with valid credentials
      [Tags]             1002     Smoke   Login
      CrmApp.Go to "Home" Page
      CrmApp."Login" With Valid Credentials   ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}

Should be able to "Add Customer"
    [Documentation]    This is a test case for adding new customer
    [Tags]             1006     Smoke   Customers

    CrmApp.Go to "Home" Page
    CrmApp."Login" With Valid Credentials   ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    CrmApp.AddCustomers  ${CU_EMAIL}    ${CU_FIRSTNAME}    ${CU_LASTNAME}    ${CU_CITY}    ${CU_STATE}    ${CU_GENDER}

Should be able to "LogOut"
    [Documentation]    This is a test case for adding new customer
    [Tags]             1006     Smoke   Login

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




