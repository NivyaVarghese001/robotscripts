*** Settings ***
Library       ${HOST}    ${USERNAME}    ${PASSWORD}

*** Variables ***
${EMPTY_STRING}
${HOST}           192.168.1.74
${USERNAME}       root
${PASSWORD}       ${EMPTY_STRING}

*** Test Cases ***
Run Command Using Custom SSH Library
    Connect
    ${output}=    Execute Command    echo Hello From Python SSH
    Should Be Equal    ${output}    Hello From Python SSH
    Close Connection