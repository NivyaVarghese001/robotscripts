*** Settings ***
Documentation    This is a test suite for the test cases of the test suite
Resource    ../../Data/InputData.robot
Resource    ../../Resources/Common/CommonWeb.robot
Resource    ../../Resources/BackOffice/BackOfficeApp.robot
Test Setup    Begin web test
Test Teardown    End web test

# robot -d Results Tests/BackOffice/Back_Office_TestSuite.robot

#robot -d Results --reporttitle "Dummy report title" --logtitle  "Dummy log title" Tests/Front_Office_TestSuite.robot --> this changes the title of the report and log


*** Test Cases ***

should be able to access "Team" page
    [Documentation]    This test case should be able to access the "Team" page
    [Tags]    test1
    BackOfficeApp.Navigate to "Landing" page



