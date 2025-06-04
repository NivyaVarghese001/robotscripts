*** Settings ***
Documentation     This is a test suite for the SeleniumLibrary
Library           SeleniumLibrary
# to run script  robot -d ../Results .\login.robot.robot

*** Variables ***

*** Test Cases ***
Shoulb be able to add new customer
    [Documentation]    This is a test case for adding new customer
    [Tags]             1006     Smoke   Contacts
    #initialize Selenium
    Set Selenium Speed      0.2s
    Set Selenium timeout    10s

    #Open Browser
    log             Starting the test case!
    open browser    https://automationplayground.com/crm/       Chrome

    # Resize Browser window for recording

    set window position    x=1    y=1
    Set window size        width=1935    height=1090
    page should contain    Customers Are Priority One
    click link             id =SignIn
    page should contain    Login

    input text              id=email-id    admin@robotframeworktutorial.com
    input text              id=password    admin123
    click button            id=submit-id
    page should contain    Our Happy Customers
    click Link              id=new-customer
    page should contain    Add Customer

    input text             id=EmailAddress      jonedoe@gmail.com
    input text             id=FirstName        Jone
    input text             id=LastName         Doe
    input text             id=City             Dallas
    select from list by value    id=StateOrRegion    TX
    select radio button          gender              female
    select checkbox              name=promos-name
    click button                 Submit
    wait until page contains    Success! New customer added.
    click link    Sign Out
    wait until page contains    Signed Out
    close browser
*** Keywords ***

