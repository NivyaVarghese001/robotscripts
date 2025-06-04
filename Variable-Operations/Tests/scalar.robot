*** Settings ***
#robot -d ../Results scalar.robot --> This runs the complete suite / Test Cases

# robot -d ../Results -i Current  scalar.robot --> This runs only the test cases with the tag Current
*** Variables ***
${MY_VARIABLE}    This my first variable in Robot Framework

*** Keywords ***

*** Test Cases ***
Variable demonstration
    [Tags]    Current

    ${my_variable}    Set Variable    Updated Variable     --> This will update the variable value only in this test case.
    Log    ${MY_VARIABLE}


Variable demonstration 2
    Log    ${MY_VARIABLE}
