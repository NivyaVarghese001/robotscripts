*** Variables ***
${backendSettings_audi_backend}                         14
${backendSettings_audibackend_locator}                  xpath=//div[@data-role='content']/div[1]/div/input
${backendSettings_component_protection_flipbutton}      css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > form:nth-child(6) > div
${backendSettings_component_protection_off}             ui-flipswitch ui-shadow-inset ui-bar-inherit ui-corner-all
${backendSettings_component_protection_on}              ui-flipswitch ui-shadow-inset ui-bar-inherit ui-corner-all ui-flipswitch-active
${backendSettings_audibackend_active}                   xpath=//div[@data-role='content']/div[1]/div/input[@value='14']
${backendSettings_elemement_verify}                     css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > div:nth-child(2) > label
${backendSettings_ODPApproval_locator}                  xpath=/html/body/div[1]/div[2]/div[2]/div/input
${backendSettings_ODPApproval_text}                     ODP APPROVAL EU
${backendSettings_Current_EsoServer}                   css=div.ui-content > div:nth-child(13) > div
${backendSettings_Current_Realm}                       css=div.ui-content > div:nth-child(15) > div
${Connect_RegistarionStatus}                            css=div:nth-child(2) > table > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)
${Connect_ServiceListState}                             css=div:nth-child(4) > table > tbody:nth-child(3) > tr:nth-child(2) > td:nth-child(2)
${Connect_ServiceList_update}                          css= div:nth-child(4) > table > tbody:nth-child(3) > tr:nth-child(3) > td:nth-child(2)
${Connect_carRegistation_Success_Text}                 car is registered
${Connect_ServiceList_True}                            true
${ConfigPage_RESET_BUTTON}                             css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button:nth-child(1)
${ConfigPage_Refresh_BUTTON}                           css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-footer.ui-bar-inherit.ui-footer-fixed.slideup > div > ul > li.ui-block-c > button
${Debugging_Verify_page_loaded}                         /debugging
${Debugging_css_reset}                                  css=body > div.ui-page.ui-page-theme-a.ui-page-footer-fixed.ui-page-active > div.ui-content > button:nth-child(17)
${Debugging_verification_message}                       xpath=/html/body/div[3]/div[2]/div/span[1]/text()
${LoginPage_Gem_title}                                  Green Engineering Menu
${LoginPage_Button_Login}                               css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
${NavCache_pageLoadText_navcache}                       Removes Content from Asia NavCache /var/navdb/navcache
${NavCache_deactivationButton_navcache}                 css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
${NavCache_verificationText_navcache}                   Output of /opt/gem/scripts/ClearNavCache.sh:
${NavHttps_pageLoadText}                                deactivate verify http backend
${NavHttps_deactivationButton}                          css=body > div.ui-page.ui-page-theme-a.ui-page-active > div.ui-content > button
${NavHttps_verificationText}                            verifyHttpBackend in /opt/navigation/etc/navconn_config.json deactivated.
${BROWSER}                                               chrome
${TARGET_IP}                                            10.94.98.42
${BASE_URL}                                             http://${TARGET_IP}:8888
${URL}                                                  ${BASE_URL}/gem
${URL_MMX_CONFIG}                                       ${BASE_URL}/gem/mmx/connect/configuration
${URL_NAV_HTTPS}                                        ${BASE_URL}/gem/mmx/navigation/asianavigation/nav_https
${URL_NAV_CACHE}                                        ${BASE_URL}/gem/mmx/navigation/asianavigation/navcache
${URL_BackendSettings}                                  ${BASE_URL}/gem/mmx/connect/backendsettings
${URL_Request_Reset_with_persistance}                   ${BASE_URL}/gem/debugging
${URL_Connect}                                          ${BASE_URL}/gem/mmx/connect


