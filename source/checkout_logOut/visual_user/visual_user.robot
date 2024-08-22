*** Settings ***
Library           String
Library           SeleniumLibrary
Library           BuiltIn
Library           RequestsLibrary

*** Variables ***
${BROWSER}        Edge
${URL}            https://www.saucedemo.com/
${USERNAME}       visual_user
${PASSWORD}       secret_sauce

*** Test Cases ***
payment_success
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    Verify Page    https://www.saucedemo.com/inventory.html
    ### ------------- ###
    Add Products
    Click Element    xpath=//a[@class='shopping_cart_link']
    Verify Page    https://www.saucedemo.com/cart.html
    ### ------------- ###
    Sleep    2s
    ${ITEMCARTNAME_1}    Get Text    css=a#item_4_title_link
    ${ITEMCARTNAME_2}    Get Text    css=a#item_0_title_link
    Click Button    css=.checkout_button
    Verify Page    https://www.saucedemo.com/checkout-step-one.html
    ### ------------- ###
    Fill Checkout Information    pham    tuan    DAKLAK-47
    Click Button    css=.btn_action
    Verify Page    https://www.saucedemo.com/checkout-step-two.html
    ### ------------- ###
    ${inventory_prices}    Get WebElements    css=.inventory_item_price
    ${total_price}    Set Variable    0
    FOR    ${price}    IN    @{inventory_prices}
        ${price_text}    Get Text    ${price}
        ${price_value}    Evaluate    float("${price_text}".split('$')[1])
        ${total_price}    Evaluate    ${total_price} + ${price_value}
    END
    ${subtotal_text}    Get Text    css=.summary_subtotal_label
    ${subtotal_value}    Evaluate    float("${subtotal_text}".split('$')[1])
    Log    Total Price: ${total_price}
    Log    Subtotal: ${subtotal_value}
    Run Keyword If    ${total_price} == ${subtotal_value}    Log    Item total mathches
    ...    ELSE    Log    item total does not match
    ### ------------- ###
    ${tax_text}    Get Text    css=.summary_tax_label
    ${tax_value}    Evaluate    float("${tax_text}".split('$')[1])
    ${total_text}    Get Text    css=.summary_total_label
    ${total_value}    Evaluate    float("${total_text}".split('$')[1])
    ${expected_total}    Evaluate    ${subtotal_value} + ${tax_value}
    Run Keyword If    ${expected_total} == ${total_value}    Log    Total price matches
    ...    ELSE    Log    Total price does not match
    Click Button    css=.cart_button
    Verify Page    https://www.saucedemo.com/checkout-complete.html
    Close Browser

pament_failed_fillinfFirstname
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
    Fill Checkout Information    \    tuan    Daklak-47
    Sleep    2s
    Click Button    css=.btn_action
    ${error_message}    Get Text    xpath=//h3[contains(text(), 'Error: First Name is required')]
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed: ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Close Browser

payment_failed_fillinfLastName
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
    Fill Checkout Information    pham    \    Daklak-47
    Sleep    2s
    Click Button    css=.btn_action
    ${error_message}    Get Text    xpath=//h3[contains(text(), 'Error: Last Name is required')]
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed: ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Close Browser

payment_failed_fillinfPostalCode
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
    Fill Checkout Information    pham    tuan    \
    Sleep    2s
    Click Button    css=.btn_action
    ${error_message}    Get Text    xpath=//h3[contains(text(), 'Error: Postal Code is required')]
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed: ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
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
    Click Button    css=.cart_button
    Verify Page    https://www.saucedemo.com/checkout-complete.html
    ### ------------- ###
    Set Window Size    320    480    # view of phone
    Capture Page Screenshot    Mobile_Checkout3.png
    Set Window Size    768    1024    # view of tablet
    Capture Page Screenshot    Tablet_Checkout3.png
    Maximize Browser Window    # view of laptop
    Capture Page Screenshot    Desktop_Checkout3.png
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

logout_finish
    Open Browser    ${URL}    ${BROWSER}
    Login
    ### ------------- ###
    Click Element    xpath=//a[@class='shopping_cart_link']
    Click Button    css=.checkout_button
    Fill Checkout Information    pham    tuan    DAKLAK-47
    Click Button    css=.btn_action
    Click Button    css=.cart_button
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

payment_UI_checkout
    Open Browser    ${URL}    ${BROWSER}
    Login
    Click Element    xpath=//a[@class='shopping_cart_link']
    ${button position x}    Get Horizontal Position    id=checkout
    ${button position y}    Get Vertical Position    id=checkout
    ${expected_x}    Set Variable    753    # Vị trí x cần kiểm tra
    ${expected_y}    Set Variable    218    # Vị trí y cần kiểm tra
    Run Keyword If    ${button position x} == ${expected_x} and ${button position y} == ${expected_y}    Log    Button position is correct
    Run Keyword If    ${button position x} != ${expected_x} or ${button position y} != ${expected_y}    Log    Button position is incorrect
    Log    Button position X is: ${button position x}
    Log    Button position Y is: ${button position y}
    Capture Page Screenshot
    Close Browser

payment_UI_cartlink
    Open Browser    ${URL}    ${BROWSER}
    Login
    Click Element    xpath=//a[@class='shopping_cart_link']
    ${button position x}    Get Horizontal Position    xpath=//a[@class='shopping_cart_link']
    ${button position y}    Get Vertical Position    xpath=//a[@class='shopping_cart_link']
    ${expected_x}    Set Variable    928    # Vị trí x cần kiểm tra
    ${expected_y}    Set Variable    10    # Vị trí y cần kiểm tra
    Run Keyword If    ${button position x} == ${expected_x} and ${button position y} == ${expected_y}    Log    Button position is correct
    Run Keyword If    ${button position x} != ${expected_x} or ${button position y} != ${expected_y}    Log    Button position is incorrect
    Log    Button position X is: ${button position x}
    Log    Button position Y is: ${button position y}
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
