*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           RequestsLibrary

*** Variables ***
${BROWSER}        Edge
${URL}            https://www.saucedemo.com/
${USERNAME}       locked_out_user
${PASSWORD}       secret_sauce

*** Test Cases ***
payment_lock
    Open Browser    ${URL}    ${BROWSER}
    Run Keyword    Login
    ${error_message}    Get Text    xpath=//h3[contains(text(), 'Epic sadface: Sorry, this user has been locked out.')]
    Run Keyword If    '${error_message}' != ''    Log    Error message is displayed:    ${error_message}
    Run Keyword If    '${error_message}' == ''    Log    Error message is not displayed
    Close Browser

*** Keywords ***
Login
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
