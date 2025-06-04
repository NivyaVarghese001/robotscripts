*** Settings ***
Documentation    This test suite is designed to test the interoperability of multiple applications within a single test case.
Resource    ../../Data/InputData.robot
Resource    ../../Resources/Common/CommonWeb.robot
Resource    ../../Resources/FrontOffice/FrontOfficeApp.robot
Resource    ../../Resources/BackOffice/BackOfficeApp.robot

Test Setup    Begin web test
Test Teardown    End web test

# robot -d Results Tests/EndToEnd/EndToEnd_TestSuite.robot

#robot -d Results --reporttitle "Dummy report title" --logtitle  "Dummy log title" Tests/Front_Office_TestSuite.robot --> this changes the title of the report and log


*** Test Cases ***

should be able to access multiple applications
    [Documentation]    This test case verified the accessibility of different application from a single test case.
    [Tags]    test1
    FrontOfficeApp.Navigate to "Landing" page
    BackOfficeApp.Navigate to "Landing" page



