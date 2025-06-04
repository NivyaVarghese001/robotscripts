*** Settings ***
Documentation    This is a test suite for the test cases of the test suite
Resource    ../Resources/CommonWeb.robot
Resource    ../Resources/FrontOfficeApp.robot
Test Setup    Begin web test
Test Teardown    End web test

# robot -d Results Tests/Front_Office_TestSuite.robot

#robot -d Results --reporttitle "Dummy report title" --logtitle  "Dummy log title" Tests/Front_Office_TestSuite.robot --> this changes the title of the report and log

*** Variables ***

${BROWSER}      chrome
${URL}          https://automationplayground.com/front-office/

*** Test Cases ***

should be able to access "Team" page
    [Documentation]    This test case should be able to access the "Team" page
    [Tags]    test1
    FrontOfficeApp.Navigate to "Landing" page
    FrontOfficeApp.Navigate to "Team" page


"Team" page should match requirements
    [Documentation]    This test case should match the requirements of the "Team" page
    [Tags]    test2
    FrontOfficeApp.Navigate to "Landing" page
    FrontOfficeApp.Navigate to "Team" page
    FrontOfficeApp.Validate "Team" page



    sleep    2