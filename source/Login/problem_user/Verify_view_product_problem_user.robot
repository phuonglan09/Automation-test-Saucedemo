*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Verify hover name product
    Open Web With problem_user
    Sleep    2
    ${color_before_hover}=    Execute JavaScript    return window.getComputedStyle(document.evaluate('//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue).color
    Mouse Over    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    Sleep    2
    ${color_after_hover}=    Execute JavaScript    return window.getComputedStyle(document.evaluate('//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue).color
    Should Not Be Equal    ${color_after_hover}    ${color_before_hover}
    Sleep    2
    Close Browser

Verify click name product
    Open Web With problem_user

    Sleep    2
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    ${image_src}    Get Element Attribute    xpath=//img[@class="inventory_item_img"]    src
    ${price_after}    Get Text    //*[@class="inventory_item_description"]//*[@data-test="inventory-item-price"]
    ${desc}    Get Text    //div[@class="inventory_item_desc" and @data-test="inventory-item-desc"]
    Click Element    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    Wait Until Element Is Visible    xpath=//*[@class="inventory_item_container"]
    ${name_detail}    Get text    //div[@class="inventory_details_name large_size" and @data-test="inventory-item-name"]
    ${image_src_detail}    Get Element Attribute    xpath=//img[@class="inventory_details_img"]    src
    ${price_before}    Get Text    xpath=//div[@class="inventory_details_desc_container"]//div[@data-test="inventory-item-price"]
    ${desc_before}    Get Text    //div[@class="inventory_details_desc large_size" and @data-test="inventory-item-desc"]
    Should be equal    ${desc_before}    ${desc}
    Should be equal    ${name_detail}    ${name_product}
    Should be equal    ${image_src_detail}    ${image_src}
    Should be equal    ${price_before}    ${price_after}
    Close Browser

Verify click des product
    Open Web With problem_user
    Sleep    2
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    Click Element    xpath=//*[@class="inventory_item_desc" and text()="Sauce Labs Backpack"]
    Wait Until Element Is Visible    xpath=//*[@class="inventory_item_container"]
    ${name_detail}    Get text    xpath=//*[@id="inventory_item_container"]//*[@data-test="inventory-item-name" and text()="Sauce Labs Backpack"]
    Should be equal    ${name_detail}    ${name_product}
    Close Browser

Verify click price product
    Open Web With problem_user
    Sleep    2
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    Click Element    xpath=//*[@class="inventory_item_price" and text()="Sauce Labs Backpack"]
    Wait Until Element Is Visible    xpath=//*[@class="inventory_item_container"]
    ${name_detail}    Get text    xpath=//*[@id="inventory_item_container"]//*[@data-test="inventory-item-name" and text()="Sauce Labs Backpack"]
    Should be equal    ${name_detail}    ${name_product}
    Close Browser

Verify click img product
    Open Web With problem_user
    Sleep    2
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    ${image_src}    Get Element Attribute    xpath=//img[@class="inventory_item_img"]    src
    ${price_after}    Get Text    //*[@class="inventory_item_description"]//*[@data-test="inventory-item-price"]
    ${desc}    Get Text    //div[@class="inventory_item_desc" and @data-test="inventory-item-desc"]
    Click Element    xpath=//*[@data-test="inventory-item-sauce-labs-backpack-img"]
    Wait Until Element Is Visible    xpath=//*[@class="inventory_item_container"]
    ${name_detail}    Get text    xpath=//*[@id="inventory_item_container"]//*[@data-test="inventory-item-name" and text()="Sauce Labs Backpack"]
    ${image_src_detail}    Get Element Attribute    xpath=//img[@class="inventory_details_img"]    src
    ${price_before}    Get Text    xpath=//div[@class="inventory_details_desc_container"]//div[@data-test="inventory-item-price"]
    Should be equal    ${name_detail}    ${name_product}
    Should be equal    ${image_src_detail}    ${image_src}
    Should be equal    ${price_before}    ${price_after}
    ${desc_before}    Get Text    //div[@class="inventory_details_desc large_size" and @data-test="inventory-item-desc"]
    Should be equal    ${desc_before}    ${desc}
    Close Browser

*** Keywords ***
Open Web With problem_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    problem_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s

Open Mobile With problem_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Set Window Size    360    640
    input text    id=user-name    problem_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
