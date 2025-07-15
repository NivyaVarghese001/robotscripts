*** Settings ***
#documentation    : This is a test suite for the example application.
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/ConfigPage.robot
Resource    ../Resources/PO/NavHttps.robot
Resource    ../Resources/PO/NavCache.robot
Resource    ../Resources/PO/BackendSettings.robot
Resource    ../Resources/PO/Debugging.robot
Resource    ../Resources/PO/Connect.robot
Library    SeleniumLibrary

*** Keywords ***
Open
    [Arguments]    ${url}
    LoginPage.Open  ${url}

Verify Page Loaded
    LoginPage.Verify Page Loaded_Gem

LogintoGem
    LoginPage.Login

VerifyConfigPageLoaded
    ConfigPage.Verify configuration page loaded

Purge
    ConfigPage.Reset

sync_page
    ConfigPage.Page_sync

nav_https_deactivation
    NavHttps.DeactivateHTTPbackend

nav_cache_clear
    NavCache.ClearNavCache

Set_AudiBackend
    BackendSettings.SetAudiBackend

DeactivateComponentProtection
    BackendSettings.DeactivateComponentProtection

InitiateResetWithPersistance
    debugging.ActiveResetWithPersistance

VerifyOnlineActivationStatus
    BackendSettings.VerifyODPApprovalStatus     ${backendSettings_ODPApproval_locator}    ${backendSettings_ODPApproval_text}

Verify Current Esobackend
    Backendsettings.verify_current_esobackend_available    ${backendSettings_Current_EsoServer}

Verify Current realm
    Backendsettings.verify_current_realm_available    ${backendSettings_Current_Realm}

Verify car_registrationstatus

    Connect.VerifyRegistationStatus    ${Connect_RegistarionStatus}     ${Connect_carRegistation_Success_Text}


Verify ServiceListState
    Connect.VerifyServiceList    ${Connect_ServiceListState}    ${Connect_ServiceList_True}

Verify ServiceListUpdateStatus
    Connect.ServicelistUptodate    ${Connect_ServiceList_update}     ${Connect_ServiceList_True}

VerifyBackendChecks
    [Documentation]    Perform all backend checks and return combined result.
    ${car_status}=    Run Keyword And Return Status    GemPage.Verify car_registrationstatus
    Run Keyword If    not ${car_status}    Fail    Car registration status verification failed.
    sleep    5s
    debugging.scroll to bottom
    ${service_state}=    Run Keyword And Return Status    GemPage.Verify ServiceListState
    Run Keyword If    not ${service_state}    Fail    Service list state verification failed.
    ${service_update}=    Run Keyword And Return Status    GemPage.Verify ServiceListUpdateStatus
    Run Keyword If    not ${service_update}    Fail    Service list update status verification failed.
    ${all_checks_passed}=    Evaluate    ${car_status} and ${service_state} and ${service_update}
    [Return]    ${all_checks_passed}

ResetWithPersistanceSteps
    Open     ${URL}
    Verify Page Loaded
    LogintoGem
    sleep    1s
    Open        ${URL_Request_Reset_with_persistance}
    sleep    1s
    InitiateResetWithPersistance
    sleep    2s
    sync_page
    sleep    90s




