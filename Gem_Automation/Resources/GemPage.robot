*** Settings ***
#documentation    : This is a test suite for the example application.
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/ConfigPage.robot
Resource    ../Resources/PO/NavHttps.robot
Resource    ../Resources/PO/NavCache.robot
Resource    ../Resources/PO/BackendSettings.robot
Resource    ../Resources/PO/debugging.robot


*** Variables ***

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

VerifyODP_EU_Approval
    backendsettings.Verify_ODP_EU_Approval
