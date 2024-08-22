*** Settings ***
Library           SeleniumLibrary

*** Variables ***

*** Test Cases ***
Login_user_standard_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Login_user_locked_out_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    locked_out_user
    input text    id=password    secret_sauce
    click button    id=login-button
    sleep    3
    Wait Until Element Is Visible    xpath=//h3[@data-test="error"]    timeout=10s
    ${error_message}=    Get Text    xpath=//h3[@data-test="error"]
    Should Be Equal As Strings    ${error_message}    Epic sadface: Sorry, this user has been locked out.
    close browser

Login_user_problem_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    problem_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Login_user_performance_glitch_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    performance_glitch_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Login_user_error_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    error_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Login_user_visual_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    visual_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Login_user_pass_NotValid
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    ~~~``````
    input text    id=password    ~~~``````
    click button    id=login-button
    Wait Until Element Is Visible    xpath=//h3[@data-test="error"]    timeout=10s
    ${error_message}=    Get Text    xpath=//h3[@data-test="error"]
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username and password do not match any user in this service
    close browser

Log in to 2 browsers with the same account
    Open Browser    https://www.saucedemo.com/    Chrome    alias=Browser1
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    Open Browser    https://www.saucedemo.com/    Edge    alias=Browser2
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close All Browsers

Login on mobile browser
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Set Window Size    360    640
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    Location Should Be    https://www.saucedemo.com/inventory.html
    close browser

Verify_credentials_clear_after_refresh
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    sleep    3
    Execute JavaScript    location.reload(true)
    Wait Until Element Is Visible    id=user-name    timeout=10s
    ${username_value}    Get Value    id=user-name
    ${password_value}    Get Value    id=password
    Should Be Equal    ${username_value}    ${EMPTY}
    Should Be Equal    ${password_value}    ${EMPTY}

Verify password Case Sensitivity
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    Secret_Sauce
    click button    id=login-button
    Wait Until Element Is Visible    xpath=//h3[@data-test="error"]    timeout=10s
    ${error_message}=    Get Text    xpath=//h3[@data-test="error"]
    Should Be Equal As Strings    ${error_message}    Epic sadface: Username and password do not match any user in this service
    close browser

Check login performance user standard
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Element is Visible    id=inventory_container    timeout=3s
    close browser

Check login performance user locked_out_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    locked_out_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Element is Visible    id=inventory_container    timeout=3s
    close browser

Check login performance user problem_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    problem_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Element is Visible    id=inventory_container    timeout=3s
    close browser

Check login performance user error_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    error_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Element is Visible    id=inventory_container    timeout=3s
    close browser

Check login performance user visual_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    visual_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Element is Visible    id=inventory_container    timeout=3s
    close browser

Click Forgot Pass
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Click element    xpath=//a[@class='forgot_password']
    Close Browser

Register User
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    Click element    xpath=//a[@class='register']
    Close Browser

login with pass 6 character
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    input text    id=password    tai
    click button    id=login-button
    Wait Until Element Is Visible    xpath=//h3[@data-test="error"]    timeout=10s
    ${error_message}=    Get Text    xpath=//h3[@data-test="error"]
    Should Be Equal As Strings    ${error_message}    Epic sadface: password more than 6 characters
    close browser

256character password
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    standard_user
    Input Text    id=password    asdjklfhjkalwsdfhkjlasdhfkjahdsfkjlhasdkjfhzxjkcvbnjkaesdhfkjlasdhfm,cnvbsadjkfhjkdlsahfjklahsdfjkahsdfjklhaslkdjfhakljsdfhjkasdhfkjlasdhfjkasdhfjkasdhfkjalsdhfjkasdhfkjasdhfjkasdhfxcvmknjklasdhjfjkhasdjklfhkjlsdhfiuweyiusdJKLCFhAIUDEFShsdjkfhjksdfhjklahsekljfhkzjsdfhjklsdhfkljashdfkjhsdkljfhaskjldfhiue4hZSDJfhakjwsedhfiuawefhasjkdfhkljasdhf
    Click Button    id=login-button
    Wait Until Element Is Visible    xpath=//h3[@data-test="error"]    timeout=10s
    ${error_message}=    Get Text    xpath=//h3[@data-test="error"]
    Should Be Equal As Strings    ${error_message}    Epic sadface: password has exceeded 256 characters
    close browser
