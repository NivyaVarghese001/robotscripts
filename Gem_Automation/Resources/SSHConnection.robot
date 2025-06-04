*** Settings ***
Library    SSHLibrary

*** Variables ***
${HOST}        10.94.98.139
${USERNAME}    root
${PASSWORD}    ""

*** Test Cases ***
Connect Without Password
    Open Connection    ${HOST}    config=StrictHostKeyChecking=no
    Login    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    echo SSH is working!
    Should Be Equal    ${output}    SSH is working!
    Close Connection

