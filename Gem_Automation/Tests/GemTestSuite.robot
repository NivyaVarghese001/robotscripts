*** Settings ***
#documentation    : This is a test suite for the example application.
Resource    ../Resources/Common.robot
Resource    ../Resources/GemPage.robot
test setup    Begin web test
test teardown    End web test

# robot -d Results Tests/GemTestSuite.robot
# robot -d Results -i clearcache -v TARGET_IP:10.94.98.42 Tests/GemTestSuite.robot
# robot -d Results -i online -v TARGET_IP:10.94.98.42 Tests/GemTestSuite.robot

# robot -d Results -i clearcache -v TARGET_IP:192.168.1.76 Tests/GemTestSuite.robot
# robot -d Results -i online -v TARGET_IP:192.168.1.76 Tests/GemTestSuite.robot

# robot -d Results -i clearcache -v TARGET_IP:10.94.98.139 Tests/GemTestSuite.robot
# robot -d Results -i online -v TARGET_IP:10.94.98.139 Tests/GemTestSuite.robot


*** Variables ***
${BROWSER}                  chrome
${TARGET_IP}                10.94.98.42
${BASE_URL}                 http://${TARGET_IP}:8888
#${BASE_URL}                 http://192.168.1.74:8888
${URL}                      ${BASE_URL}/gem
${URL_MMX_CONFIG}           ${BASE_URL}/gem/mmx/connect/configuration
${URL_NAV_HTTPS}            ${BASE_URL}/gem/mmx/navigation/asianavigation/nav_https
${URL_NAV_CACHE}            ${BASE_URL}/gem/mmx/navigation/asianavigation/navcache
${URL_BackendSettings}      ${BASE_URL}/gem/mmx/connect/backendsettings
${URL_Request_Reset_with_persistance}       ${BASE_URL}/gem/debugging
*** Test Cases ***

GemLogin
    [Documentation]    This test case logs in to the application using a gem.
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    3s

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


DeactivateHTTPbackend
    [Tags]    clearcache
    GemPage.Open     ${URL}
    GemPage.LogintoGem
    sleep    3s
    GemPage.Open        ${URL_NAV_HTTPS}
    GemPage.VerifyConfigPageLoaded
    GemPage.nav_https_deactivation
    sleep    2s
    GemPage.sync_page

DeactivateNavCache
    [Tags]    clearcache
    GemPage.Open     ${URL}
    GemPage.LogintoGem
    sleep    3s
    GemPage.Open        ${URL_NAV_CACHE}
    GemPage.VerifyConfigPageLoaded
    GemPage.nav_cache_clear
    sleep    2s
    GemPage.sync_page
    log to console    !!!!! PLEASE RESTART TARGET !!!!!!!!!!!!

ResetWithPersistance
    [Tags]  now
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_Request_Reset_with_persistance}
    sleep    1s
    GemPage.InitiateResetWithPersistance
    sleep    2s
    GemPage.sync_page
    sleep    90s



SetBackEndSettings
    [Tags]    online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_BackendSettings}
    sleep    3s
    GemPage.Set_AudiBackend

DeactivateComponentProtection
    [Tags]    online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_BackendSettings}
    sleep    2s
    GemPage.DeactivateComponentProtection
    sleep    2s
    GemPage.sync_page
    sleep   60s
    GemPage.Verify_ODP_EU_Approval
    #add steps to verify the successfull online connection , ODP EU APPROVAL , ServiceList verified or Approval

ResetWithPersistance
    [Tags]  online
    GemPage.Open     ${URL}
    GemPage.Verify Page Loaded
    GemPage.LogintoGem
    sleep    1s
    GemPage.Open        ${URL_Request_Reset_with_persistance}
    sleep    1s
    GemPage.InitiateResetWithPersistance
    sleep    2s
    GemPage.sync_page
    sleep    90s




