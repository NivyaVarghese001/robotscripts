*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${newcustomer_ID}                       id=new-customer
${Add_Customer_Verification_text}       Add Customer
${newcustomer_email}                    id=EmailAddress
${newcustomer_firstname}                id=FirstName
${newcustomer_lastname}                 id=LastName
${newcustomer_city}                     id=City
${newcustomer_state}                    id=StateOrRegion
${newcustomer_gender}                   gender
${promo_text}                           name=promos-name
${successful_message}                   Success! New customer added.
${submit_text}                          Submit
*** Keywords ***
Select Add "New Customer"
    click link    ${newcustomer_ID}
    verify page loaded


Fill New Customer Form
    [Arguments]    ${email}   ${firstname}    ${lastname}    ${city}   ${state}  ${gender}

    input text                      ${newcustomer_email}           ${email}
    input text                      ${newcustomer_firstname}       ${firstname}
    input text                      ${newcustomer_lastname}        ${lastname}
    input text                      ${newcustomer_city}            ${city}
    select from list by value       ${newcustomer_state}           ${state}
    select radio button             ${newcustomer_gender}          ${gender}
    select checkbox                 ${promo_text}


Verify Page Loaded
    wait until page contains      ${Add_Customer_Verification_text}

Verify Valid Customerdetails entered
    click button                 ${submit_text}
    wait until page contains     ${successful_message}