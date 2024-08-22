*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           RequestsLibrary
Library           String

*** Variables ***
${BROWSER}        Edge
${URL}            https://www.saucedemo.com/
${USERNAME}       error_user
${PASSWORD}       secret_sauce

*** Test Cases ***
payment_fail_finish
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    Verify Page    https://www.saucedemo.com/inventory.html
    ### ------------- ###
    Add Products
    Click Element    xpath=//a[@class='shopping_cart_link']
    Verify Page    https://www.saucedemo.com/cart.html
    ### ------------- ###
    Click Button    css=.checkout_button
    Verify Page    https://www.saucedemo.com/checkout-step-one.html
    ### ------------- ###
    Fill Checkout Information    pham    tuan    DAKLAK-47
    Capture Page Screenshot
    Click Button    css=.btn_action
    Click Button    css=.cart_button
    Capture Page Screenshot
    Close Browser

payment_fail_infFirstname
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    Verify Page    https://www.saucedemo.com/inventory.html
    ### ------------- ###
    Add Products
    Click Element    xpath=//a[@class='shopping_cart_link']
    Verify Page    https://www.saucedemo.com/cart.html
    ### ------------- ###
    Click Button    css=.checkout_button
    Verify Page    https://www.saucedemo.com/checkout-step-one.html
    ### ------------- ###
    Fill Checkout Information    \    tuan    DAKLAK-47
    Click Button    css=.btn_action
    ${error_message}    Get Text    css=.error h3
    Log    ${error_message}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed: ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

payment_fail_postalcode
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    Verify Page    https://www.saucedemo.com/inventory.html
    ### ------------- ###
    Add Products
    Click Element    xpath=//a[@class='shopping_cart_link']
    Verify Page    https://www.saucedemo.com/cart.html
    ### ------------- ###
    Click Button    css=.checkout_button
    Verify Page    https://www.saucedemo.com/checkout-step-one.html
    ### ------------- ###
    Fill Checkout Information    pham    tuan    \
    Click Button    css=.btn_action
    ${error_message}    Get Text    css=.error h3
    Log    ${error_message}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed: ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

payment_Reponsive
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    Verify Page    https://www.saucedemo.com/inventory.html
    ### ------------- ###
    Add Products
    Click Element    xpath=//a[@class='shopping_cart_link']
    Verify Page    https://www.saucedemo.com/cart.html
    ### ------------- ###
    Sleep    2s
    Click Button    css=.checkout_button
    Verify Page    https://www.saucedemo.com/checkout-step-one.html
    ### ------------- ###
    Set Window Size    320    480    # view of phone
    Capture Page Screenshot    Mobile_Checkout1.png
    Set Window Size    768    1024    # view of tablet
    Capture Page Screenshot    Tablet_Checkout1.png
    Maximize Browser Window    # view of laptop
    Capture Page Screenshot    Desktop_Checkout1.png
    ### ------------- ###
    Fill Checkout Information    pham    tuan    DAKLAK-47
    Click Button    css=.btn_action
    Verify Page    https://www.saucedemo.com/checkout-step-two.html
    ### ------------- ###
    Set Window Size    320    480    # view of phone
    Capture Page Screenshot    Mobile_Checkout2.png
    Set Window Size    768    1024    # view of tablet
    Capture Page Screenshot    Tablet_Checkout2.png
    Maximize Browser Window    #view of laptop
    Capture Page Screenshot    Desktop_Checkout2.png
    ### ------------- ###
    Close Browser

payment_performance
    [Documentation]    Test performance of the website
    Create Session    saucedemo    https://www.saucedemo.com
    # Đo thời gian phản hồi của yêu cầu GET
    ${start_time}    Get Current Date    result_format=%s
    ${response}    Get    saucedemo    /checkout-step-one.html
    ${end_time}    GET Current Date    result_format=%s
    ${response_time}    Evaluate    ${end_time} - ${start_time}
    Log    Response Time (GET): ${response_time} ms
    Time Should Be Less Than    ${response_time}    2000
    # Đo thời gian phản hồi của yêu cầu POST
    ${payload}    Create Dictionary    username=user1    password=pass1
    ${start_time_post}    GET Current Date    result_format=%s
    ${response_post}    Post    saucedemo    /checkout-step-one.html    data=${payload}
    ${end_time_post}    Get Current Date    result_format=%s
    ${response_time_post}    Evaluate    ${end_time_post} - ${start_time_post}
    Log    Response Time (POST): ${response_time_post} ms
    Time Should Be Less Than    ${response_time_post}    2000

logout_homepage
    Open Browser    ${URL}    ${BROWSER}
    Login
    ### ------------- ###
    Click Button    css=#react-burger-menu-btn
    sleep    1s
    Click Element    id=logout_sidebar_link
    Element Should Be Visible    css=#login-button
    Go Back
    ${modified_string}    Get Text    css=.error h3
    ${error_message}=    Replace String    ${modified_string}    '    ${EMPTY}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed:
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

logout_cart
    Open Browser    ${URL}    ${BROWSER}
    Login
    ### ------------- ###
    Click Element    xpath=//a[@class='shopping_cart_link']
    Click Button    css=#react-burger-menu-btn
    sleep    1s
    Click Element    id=logout_sidebar_link
    Element Should Be Visible    css=#login-button
    Go Back
    ${modified_string}    Get Text    css=.error h3
    ${error_message}=    Replace String    ${modified_string}    '    ${EMPTY}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed:
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

logout_checkoutStep1
    Open Browser    ${URL}    ${BROWSER}
    Login
    ### ------------- ###
    Click Element    xpath=//a[@class='shopping_cart_link']
    Click Button    css=.checkout_button
    Click Button    css=#react-burger-menu-btn
    sleep    1s
    Click Element    id=logout_sidebar_link
    Element Should Be Visible    css=#login-button
    Go Back
    ${modified_string}    Get Text    css=.error h3
    ${error_message}=    Replace String    ${modified_string}    '    ${EMPTY}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed:
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

logout_checkoutStep2
    Open Browser    ${URL}    ${BROWSER}
    Login
    ### ------------- ###
    Click Element    xpath=//a[@class='shopping_cart_link']
    Click Button    css=.checkout_button
    Fill Checkout Information    pham    tuan    DAKLAK-47
    Click Button    css=.btn_action
    Click Button    css=#react-burger-menu-btn
    sleep    1s
    Click Element    id=logout_sidebar_link
    Element Should Be Visible    css=#login-button
    Go Back
    ${modified_string}    Get Text    css=.error h3
    ${error_message}=    Replace String    ${modified_string}    '    ${EMPTY}
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed:
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action

Verify Page
    [Arguments]    ${excepted_url}
    Location Should Be    ${excepted_url}

Add Products
    Click Element    xpath=//button[@id='add-to-cart-sauce-labs-backpack']
    Click Element    xpath=//button[@id='add-to-cart-sauce-labs-bike-light']

Fill Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${postal_code}
