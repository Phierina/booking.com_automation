*** Settings ***
Library    AppiumLibrary

*** Variables ***
${EMAIL_TEST}  pcgpruebas6@gmail.com
${PASSWORD_TEST}  Pruebas$421$
${DESTINY}  Cusco

*** Keywords ***
Launch Android Application
    Open Application
    ...     http://localhost:4723/wd/hub
    ...     platformName=Android
    ...     deviceName=emulator-5554
    ...     appPackage=com.booking
    ...     appActivity=com.booking.startup.HomeActivity
    ...     automationName=UIAutomator2

Login
    Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.widget.Button
    Click Element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.widget.Button
    Wait Until Element Is Visible   com.booking:id/identity_text_input_edit_text
    Input Text    com.booking:id/identity_text_input_edit_text    ${EMAIL_TEST}
    Click Element    com.booking:id/identity_landing_social_button
    Sleep    2s
    Wait Until Element Is Visible   com.booking:id/identity_text_input_edit_text
    Input Text    com.booking:id/identity_text_input_edit_text    ${PASSWORD_TEST}
    Click Element    com.booking:id/identity_landing_social_button
    #Sleep    3s
    Wait Until Element Is Visible   com.booking:id/genius_onbaording_bottomsheet_cta
    Click Element    com.booking:id/genius_onbaording_bottomsheet_cta

Reserve Destiny Cusco

    Wait Until Element Is Visible   com.booking:id/facet_search_box_basic_field_label
    Click Element    com.booking:id/facet_search_box_basic_field_label

    Wait Until Element Is Visible   com.booking:id/facet_with_bui_free_search_booking_header_toolbar_content
    Input Text    com.booking:id/facet_with_bui_free_search_booking_header_toolbar_content    ${DESTINY}
    Click Element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView[2]

    Wait Until Element Is Visible   xpath=//android.view.View[@content-desc="14 February 2023"]
    Click Element   xpath=//android.view.View[@content-desc="14 February 2023"]
    Click Element   xpath=//android.view.View[@content-desc="28 February 2023"]
    Click Element   com.booking:id/facet_date_picker_confirm
    #
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout[3]/android.widget.TextView
    Click Element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout[3]/android.widget.TextView
    #
    Wait Until Element Is Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.view.ViewGroup[3]/android.widget.LinearLayout/android.widget.Button[2]
    Click Element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.view.ViewGroup[3]/android.widget.LinearLayout/android.widget.Button[2]
    # Swipe UP (6 veces):
    ${element_swipe}=   Evaluate    'com.booking:id/age_picker_view'
    Wait Until Element Is Visible   ${element_swipe}
    ${element_size}=    Get Element Size    ${element_swipe}
    ${element_location}=    Get Element Location    ${element_swipe}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
    FOR    ${index}    IN RANGE    6    # 6 veces
        Swipe   ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
        Sleep  0.5
    END

    Click Element    android:id/button1

    Wait Until Element Is Visible    com.booking:id/group_config_apply_button
    Click Element    com.booking:id/group_config_apply_button

    Wait Until Element Is Visible    com.booking:id/facet_search_box_cta
    Click Element    com.booking:id/facet_search_box_cta

    Sleep       3s

    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup

    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout[2]/android.view.ViewGroup
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout[2]/android.view.ViewGroup

    Wait Until Element Is Visible   com.booking:id/rooms_item_select_text_view
    Click Element   com.booking:id/rooms_item_select_text_view

    Wait Until Element Is Visible   com.booking:id/room_pref_select
    Click Element   com.booking:id/room_pref_select

    Wait Until Element Is Visible   com.booking:id/main_action
    Click Element   com.booking:id/main_action


*** Test Cases ***
Execute Test:
    Launch Android Application
    Login
    Reserve Destiny Cusco

