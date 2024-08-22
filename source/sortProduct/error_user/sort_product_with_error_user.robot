*** Settings ***
Library           SeleniumLibrary

*** Variables ***

*** Test Cases ***
sort name z-a
    Open Web With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    za
    sleep    3
    ${first_product_name}=    Get Text    xpath=(//div[@class='inventory_item_name ' and @data-test='inventory-item-name'])[1]
    Should Be Equal    ${first_product_name}    Test.allTheThings() T-Shirt (Red)
    Close browser

sort name a-z
    Open Web With error_user
    sleep    2
    Select From List by Value    xpath=//select[@class='product_sort_container']    za
    sleep    2
    Select From List by Value    xpath=//select[@class='product_sort_container']    az
    sleep    2
    ${first_product_name}=    Get Text    xpath=(//div[@class='inventory_item_name ' and @data-test='inventory-item-name'])[1]
    Should Be Equal    ${first_product_name}    Sauce Labs Backpack
    Close browser

sort price low to high
    Open Web With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    lohi
    sleep    3
    ${product_prices}=    Get WebElements    xpath=//div[@class='inventory_item_price' and @data-test='inventory-item-price']
    ${first_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[1]
    ${last_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[last()]
    ${second_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[2]
    ${first_product_price}=    Evaluate    ${first_product_price.split('$')[1]} if '$' in "${first_product_price}" else "${first_product_price}"
    ${first_price_float}=    Convert to number    ${first_product_price}
    ${second_product_price}=    Evaluate    ${second_product_price.split('$')[1]} if '$' in "${second_product_price}" else "${second_product_price}"
    ${second_price_float}=    Convert to number    ${second_product_price}
    ${last_product_price}=    Evaluate    ${last_product_price.split('$')[1]} if '$' in "${last_product_price}" else "${last_product_price}"
    ${last_price_float}=    Convert to number    ${last_product_price}
    Should Be True    ${first_price_float} < ${last_price_float}
    Should Be True    ${first_price_float} < ${second_price_float}
    Should Be True    ${second_price_float} < ${last_price_float}
    Close browser

sort price high to low
    Open Web With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    hilo
    sleep    3
    ${product_prices}=    Get WebElements    xpath=//div[@class='inventory_item_price' and @data-test='inventory-item-price']
    ${first_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[1]
    ${last_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[last()]
    ${second_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[2]
    ${first_product_price}=    Evaluate    ${first_product_price.split('$')[1]} if '$' in "${first_product_price}" else "${first_product_price}"
    ${first_price_float}=    Convert to number    ${first_product_price}
    ${second_product_price}=    Evaluate    ${second_product_price.split('$')[1]} if '$' in "${second_product_price}" else "${second_product_price}"
    ${second_price_float}=    Convert to number    ${second_product_price}
    ${last_product_price}=    Evaluate    ${last_product_price.split('$')[1]} if '$' in "${last_product_price}" else "${last_product_price}"
    ${last_price_float}=    Convert to number    ${last_product_price}
    Should Be True    ${first_price_float} > ${last_price_float}
    Should Be True    ${first_price_float} > ${second_price_float}
    Should Be True    ${second_price_float} > ${last_price_float}
    Close browser

sort name z-a - in mobile
    Open Mobile With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    za
    sleep    3
    ${first_product_name}=    Get Text    xpath=(//div[@class='inventory_item_name ' and @data-test='inventory-item-name'])[1]
    Should Be Equal    ${first_product_name}    Test.allTheThings() T-Shirt (Red)
    Close browser

sort name a-z - in mobile
    Open Mobile With error_user
    sleep    2
    Select From List by Value    xpath=//select[@class='product_sort_container']    za
    sleep    2
    Select From List by Value    xpath=//select[@class='product_sort_container']    az
    sleep    2
    ${first_product_name}=    Get Text    xpath=(//div[@class='inventory_item_name ' and @data-test='inventory-item-name'])[1]
    Should Be Equal    ${first_product_name}    Sauce Labs Backpack
    Close browser

sort price low to high - in mobile
    Open Mobile With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    lohi
    sleep    3
    ${product_prices}=    Get WebElements    xpath=//div[@class='inventory_item_price' and @data-test='inventory-item-price']
    ${first_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[1]
    ${last_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[last()]
    ${second_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[2]
    ${first_product_price}=    Evaluate    ${first_product_price.split('$')[1]} if '$' in "${first_product_price}" else "${first_product_price}"
    ${first_price_float}=    Convert to number    ${first_product_price}
    ${second_product_price}=    Evaluate    ${second_product_price.split('$')[1]} if '$' in "${second_product_price}" else "${second_product_price}"
    ${second_price_float}=    Convert to number    ${second_product_price}
    ${last_product_price}=    Evaluate    ${last_product_price.split('$')[1]} if '$' in "${last_product_price}" else "${last_product_price}"
    ${last_price_float}=    Convert to number    ${last_product_price}
    Should Be True    ${first_price_float} < ${last_price_float}
    Should Be True    ${first_price_float} < ${second_price_float}
    Should Be True    ${second_price_float} < ${last_price_float}
    Close browser

sort price high to low - in mobile
    Open Mobile With error_user
    sleep    3
    Select From List by Value    xpath=//select[@class='product_sort_container']    hilo
    sleep    3
    ${product_prices}=    Get WebElements    xpath=//div[@class='inventory_item_price' and @data-test='inventory-item-price']
    ${first_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[1]
    ${last_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[last()]
    ${second_product_price}=    Get Text    xpath=(//div[@class='inventory_item_price' and @data-test='inventory-item-price'])[2]
    ${first_product_price}=    Evaluate    ${first_product_price.split('$')[1]} if '$' in "${first_product_price}" else "${first_product_price}"
    ${first_price_float}=    Convert to number    ${first_product_price}
    ${second_product_price}=    Evaluate    ${second_product_price.split('$')[1]} if '$' in "${second_product_price}" else "${second_product_price}"
    ${second_price_float}=    Convert to number    ${second_product_price}
    ${last_product_price}=    Evaluate    ${last_product_price.split('$')[1]} if '$' in "${last_product_price}" else "${last_product_price}"
    ${last_price_float}=    Convert to number    ${last_product_price}
    Should Be True    ${first_price_float} > ${last_price_float}
    Should Be True    ${first_price_float} > ${second_price_float}
    Should Be True    ${second_price_float} > ${last_price_float}
    Close browser

*** Keywords ***
Open Web With error_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    error_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s

Open Mobile With error_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Set Window Size    360    640
    input text    id=user-name    error_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
