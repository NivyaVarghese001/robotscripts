*** Settings ***
# This is a Keywords file for this application and will not be containing library explicitly
# will be defining PO files from resources to interact.*** Settings ***
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/Signin.robot
Resource    ../Resources/PO/TopNav.robot
Resource    ../Resources/PO/LoggedOut.robot
Resource    ../Resources/PO/Customers.robot
Resource    ../Resources/PO/AddCustomers.robot
*** Variables ***

*** Keywords ***
Go to "Home" Page
    Home.Navigate to
    Home.Verify Page Loaded

"Login" With Valid Credentials
    [Arguments]  ${Email}  ${Password}
    TopNav.Click "SignIn" Link
    Signin.Verify Page Loaded
    Signin.Login with Valid Credentials     ${Email}  ${Password}
    Customers.Verify Page Loaded

AddCustomers
    [Arguments]    ${NewCutomerEmail}    ${NewCustomerFirstName}    ${NewCustomerLastName}   ${NewCustomerCity}  ${NewCustomerState}    ${gender}
    AddCustomers.Select Add "New Customer"
    AddCustomers.Fill New Customer Form    ${NewCutomerEmail}    ${NewCustomerFirstName}    ${NewCustomerLastName}   ${NewCustomerCity}  ${NewCustomerState}    ${gender}
    AddCustomers.Verify Valid Customerdetails entered

"LogOut" after successful addition of new customer
    TopNav.Click "SignOut" Link
    LoggedOut.Verify Page Loaded
