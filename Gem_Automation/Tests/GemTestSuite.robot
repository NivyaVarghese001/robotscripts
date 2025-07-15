*** Settings ***
#documentation    : This is a test suite for the example application.
Resource    ../Resources/Common.robot
Resource    ../Resources/GemPage.robot
Resource    ../Resources/SSHConnectionTest.robot

Resource    ../Data/AutomatedInputData.robot

test setup    Begin web test
test teardown    End web test

# 1. Can be used to run the suite for update rc.local file to UTC and perform clear cache.
#     robot -d Results -i UpdateTime -i clearcache -v TARGET_IP:<Target IP> .\Tests\GemTestSuite.robot
#  <Example>  robot -d Results -i UpdateTime -i clearcache -v TARGET_IP:10.94.98.139 .\Tests\GemTestSuite.robot

# 2.  Can be used to run the suite only for clearing the cache
#     robot -d Results -i clearcache -v TARGET_IP:<Target IP> Tests/GemTestSuite.robot

# 3. For running testcases for online
#       JP/TW/KR backend

#       robot -d .\Results -i online -v TARGET_IP:<TARGET IP>   .\Tests\GemTestSuite.robot
#           OR
#       robot -d .\Results -i online -v TARGET_IP:<TARGET IP> -v backendSettings_audi_backend:14 .\Tests\GemTestSuite.robot
# <Example>    robot -d .\Results -i online -v TARGET_IP:10.94.98.139 -v backendSettings_audi_backend:14 .\Tests\GemTestSuite.robot

#       China backend

#       robot -d .\Results -i online -v TARGET_IP:<TARGET IP> -v backendSettings_audi_backend:27 .\Tests\GemTestSuite.robot

*** Test Cases ***


Update system time in RC.Local
    [Setup]     NONE
    [Teardown]    NONE
    [Tags]    UpdateTime
    SSHConnectionTest.Connect to Target and copy rc.local
    SSHConnectionTest.Disconnect Connection

Reset core services
    #[Documentation]    This test case resets the core services.
    [Tags]    clearcache
    log     The target IP is ${TARGET_IP}
    GemPage.Open     ${URL}
    GemPage.LogintoGem
    sleep    3s
    GemPage.Open         ${URL_MMX_CONFIG}
    sleep    3s
    GemPage.VerifyConfigPageLoaded
    GemPage.Purge


DeactivateHTTPbackend and ClearNavCache
    [Tags]    clearcache
    GemPage.Open     ${URL}
    GemPage.LogintoGem
    sleep    3s
    GemPage.Open        ${URL_NAV_HTTPS}
    GemPage.VerifyConfigPageLoaded
    GemPage.nav_https_deactivation
    sleep    2s
    GemPage.sync_page
    GemPage.Open        ${URL_NAV_CACHE}
    GemPage.VerifyConfigPageLoaded
    GemPage.nav_cache_clear
    sleep    2s
    GemPage.sync_page
    log to console    !!!!! PLEASE RESTART TARGET !!!!!!!!!!!!
    log to console    !!!!! After Restating please run script for online init !!!!!!!!!!!!

DeactivateNavCache
    [Tags]    Low priority, clearcache
    GemPage.Open     ${URL}
    GemPage.LogintoGem
    sleep    3s
    GemPage.Open        ${URL_NAV_CACHE}
    GemPage.VerifyConfigPageLoaded
    GemPage.nav_cache_clear
    sleep    2s
    GemPage.sync_page
    log to console    !!!!! PLEASE RESTART TARGET !!!!!!!!!!!!
    log to console    !!!!! After Restating please run script for online init !!!!!!!!!!!!



SetBackEndSettings and DeactivateComponentProtection
    [Tags]    online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_BackendSettings}
    sleep    3s
    GemPage.Set_AudiBackend
    GemPage.DeactivateComponentProtection
    sleep    2s
    GemPage.sync_page
    sleep   2s

DeactivateComponentProtection
    [Tags]    Low priority, online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_BackendSettings}
    sleep    2s
    GemPage.DeactivateComponentProtection
    sleep    2s
    GemPage.sync_page
    sleep   2s

VerifyOnlineActivationStatus
    [Documentation]    This test case verifies the online activation status.
    [Tags]     Low priority, online activation details
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_BackendSettings}
    sleep    10s
    #GemPage.VerifyOnlineActivationStatus
    debugging.scroll to bottom
    GemPage.Verify Current Esobackend
    GemPage.Verify Current realm

VerifyBackendRegistartionStatus
    [Documentation]    This test case verifies the backend registration status.
    [Tags]      online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_Connect}
    sleep    5s
    ${all_checks_passed}=    GemPage.VerifyBackendChecks
    set suite variable      ${all_checks_passed}    ${all_checks_passed}

ResetWithPersistance
    [Tags]  online
    Run Keyword If    ${all_checks_passed}    GemPage.ResetWithPersistanceSteps








