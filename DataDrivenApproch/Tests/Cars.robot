*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Documentation    '''In Robot Framework,
a [Template] setting is used to define a test case template that allows you to reuse the same test steps with different sets of data.
It simplifies data-driven testing by associating a template keyword with multiple arguments, which are passed as test data.
In the provided code, the [Template] setting is used in the test case Invalid login scenarios should display correct error messages.
The keyword Test Multiple Login Scenarios acts as the template, and
the arguments (${UNREGISTERED_USER}, ${INVALID_PASSWORD_USER}, ${BLANK_CREDENTIALS_USER}) are
the data sets that will be passed to the template keyword during execution.
This means the test case will execute the Test Multiple Login Scenarios keyword three times,
once for each argument, allowing you to test different login scenarios without duplicating the test steps.
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/CarsApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/Cars.robot

*** Variables ***

*** Test Cases ***
Invalid login scenarios should display correct error messages
    [Template]  Test Multiple Login Scenarios
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD_USER}
    ${BLANK_CREDENTIALS_USER}
