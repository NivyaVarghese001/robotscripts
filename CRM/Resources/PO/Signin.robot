*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SIGNIN_EMAIL_TEXTBOX}         id=email-id
${SIGNIN_PASSWORD_TEXTBOX}      id=password
${SIGNIN_SUBMIT_TEXTBOX}        id=submit-id
${SIGNIN_LOGIN_LABEL}            Login
*** Keywords ***
Verify Page Loaded
    wait until page contains        ${SIGNIN_LOGIN_LABEL}

Login with Valid Credentials
    [Arguments]    ${Email}    ${Password}
    Fill "Email" Field          ${Email}
    Fill "Password" Field       ${Password}
    Click "Submit" Button


Fill "Email" Field
    [Arguments]    ${Email}
    input text      ${SIGNIN_EMAIL_TEXTBOX}     ${Email}

Fill "Password" Field
    [Arguments]    ${Password}
    input text      ${SIGNIN_PASSWORD_TEXTBOX}      ${Password}


Click "Submit" Button
    click button                ${SIGNIN_SUBMIT_TEXTBOX}

