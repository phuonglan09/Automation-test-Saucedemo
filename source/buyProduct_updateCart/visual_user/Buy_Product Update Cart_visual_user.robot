*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Add 1 product
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    ${price_after}    Get Text    //*[@class="inventory_item_description"]//*[@data-test="inventory-item-price"]
    ${desc}    Get Text    //div[@class="inventory_item_desc" and @data-test="inventory-item-desc"]
    Should be True    ${sl}==1
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    ${name_product_cart}    Get text    //div[@class='inventory_item_name']
    ${price_before}    Get Text    //div[@class='inventory_item_price']
    ${desc_before}    Get Text    //div[@class='inventory_item_desc']
    ${sl_before}=    Get text    //div[@class='cart_quantity']
    Should be True    ${sl}==${sl_before}
    Should be equal    ${name_product}    ${name_product_cart}
    Should be equal    ${price_after}    ${price_before}
    Should be equal    ${desc}    ${desc_before}
    Close browser

add more products
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    ${price_after}    Get Text    //*[@class="inventory_item_description"]//*[@data-test="inventory-item-price"]
    ${desc}    Get Text    //div[@class="inventory_item_desc" and @data-test="inventory-item-desc"]
    ${name_product_2}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Bike Light"]
    ${price_after_2}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_price']
    ${desc_2}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_desc']
    ${name_product_3}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Bolt T-Shirt"]
    ${price_after_3}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bolt T-Shirt')]]//div[@class='inventory_item_price']
    ${desc_3}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bolt T-Shirt')]]//div[@class='inventory_item_desc']
    Should be True    ${sl}==3
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    ${name_product_cart}    Get text    //div[@class='inventory_item_name']
    ${price_before}    Get Text    //div[@class='inventory_item_price']
    ${desc_before}    Get Text    //div[@class='inventory_item_desc']
    ${sl_before}=    Get text    //div[@class='cart_quantity']
    Should be equal    ${name_product}    ${name_product_cart}
    Should be equal    ${price_after}    ${price_before}
    Should be equal    ${desc}    ${desc_before}
    ${name_product_cart_2}    Get text    //div[@class='cart_item']//div[@class='inventory_item_name'][contains(text(), 'Sauce Labs Bike Light')]
    ${price_before_2}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_price']
    ${desc_before_2}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_desc']
    ${name_product_cart_3}    Get text    //div[@class='cart_item']//div[@class='inventory_item_name'][contains(text(), 'Sauce Labs Bolt T-Shirt')]
    ${price_before_3}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bolt T-Shirt')]]//div[@class='inventory_item_price']
    ${desc_before_3}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bolt T-Shirt')]]//div[@class='inventory_item_desc']
    Should be equal    ${name_product_2}    ${name_product_cart_2}
    Should be equal    ${price_after_2}    ${price_before_2}
    Should be equal    ${desc_2}    ${desc_before_2}
    Should be equal    ${name_product_3}    ${name_product_cart_3}
    Should be equal    ${price_after_3}    ${price_before_3}
    Should be equal    ${desc_3}    ${desc_before_3}
    Close browser

Delete 1 product at Products
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==1
    Click Element    //button[@id='remove-sauce-labs-backpack']
    ${badge_exist}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//span[@class='shopping_cart_badge']
    Should Be true    ${badge_exist}
    Sleep    5
    Close browser

Delete 1 product from many products at Products
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Click element    //button[@id='add-to-cart-sauce-labs-bike-light']
    Click element    //button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==3
    Click element    //button[@id='remove-sauce-labs-backpack']
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==2
    Sleep    5
    Close Browser

Delete 1 product at Cart
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==1
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    Click Element    //button[@id='remove-sauce-labs-backpack']
    ${badge_exist}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//span[@class='shopping_cart_badge']
    sleep    5
    Close browser

Delete 1 product from many products at Cart
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Click element    //button[@id='add-to-cart-sauce-labs-bike-light']
    Click element    //button[@id='add-to-cart-sauce-labs-bolt-t-shirt']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==3
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    Click element    //button[@id='remove-sauce-labs-backpack']
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==2
    Sleep    5
    Close Browser

Verify click cart
    Open Web With visual_user
    Sleep    5
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    Location Should Be    https://www.saucedemo.com/cart.html
    Close Browser

Add more product + Countinue Shopping
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    ${name_product}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Backpack"]
    ${price_after}    Get Text    //*[@class="inventory_item_description"]//*[@data-test="inventory-item-price"]
    ${desc}    Get Text    //div[@class="inventory_item_desc" and @data-test="inventory-item-desc"]
    Should be True    ${sl}==1
    Click element    //a[@class='shopping_cart_link']
    Sleep    3
    ${name_product_cart}    Get text    //div[@class='inventory_item_name']
    ${price_before}    Get Text    //div[@class='inventory_item_price']
    ${desc_before}    Get Text    //div[@class='inventory_item_desc']
    ${sl_before}=    Get text    //div[@class='cart_quantity']
    Should be True    ${sl}==${sl_before}
    Should be equal    ${name_product}    ${name_product_cart}
    Should be equal    ${price_after}    ${price_before}
    Should be equal    ${desc}    ${desc_before}
    Click element    //button[@id='continue-shopping']
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-bike-light']
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==2
    ${name_product_2}    Get text    xpath=//*[@class="inventory_item_name " and text()="Sauce Labs Bike Light"]
    ${price_after_2}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_price']
    ${desc_2}    Get Text    //div[contains(@class, 'inventory_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_desc']
    Click element    //a[@class='shopping_cart_link']
    ${name_product_cart_2}    Get text    //div[@class='cart_item']//div[@class='inventory_item_name'][contains(text(), 'Sauce Labs Bike Light')]
    ${price_before_2}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_price']
    ${desc_before_2}    Get Text    //div[contains(@class, 'cart_item') and .//div[contains(@class, 'inventory_item_name') and contains(text(), 'Sauce Labs Bike Light')]]//div[@class='inventory_item_desc']
    Should be equal    ${name_product_2}    ${name_product_cart_2}
    Should be equal    ${price_after_2}    ${price_before_2}
    Should be equal    ${desc_2}    ${desc_before_2}
    Close browser

Verify click countinue Shopping
    Open Web With visual_user
    Sleep    5
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    Click element    //button[@id='continue-shopping']
    Location Should Be    https://www.saucedemo.com/inventory.html
    Sleep    5
    Close Browser

Verify click checkout
    Open Web With visual_user
    Sleep    5
    Click element    //a[@class='shopping_cart_link']
    Sleep    5
    Click element    //button[@id='checkout']
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html
    Sleep    5
    Close Browser

Ability to store information with 2 account
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==1
    Click element    //button[@id='react-burger-menu-btn']
    Sleep    5
    Click element    //a[@id='logout_sidebar_link']
    sleep    5
    input text    id=user-name    problem_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    ${span_not_exists}=    Run Keyword And Return Status    Element Should Not Be Visible    //div[@id='shopping_cart_container']//span[@class='shopping_cart_badge']
    Should Be True    ${span_not_exists}

Ability to store information 1 account
    Open Web With visual_user
    Sleep    5
    Click element    //button[@id='add-to-cart-sauce-labs-backpack']
    Sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==1
    Click element    //button[@id='react-burger-menu-btn']
    Sleep    5
    Click element    //a[@id='logout_sidebar_link']
    sleep    5
    input text    id=user-name    standard_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
    sleep    5
    ${sl}=    Get text    //span[@class='shopping_cart_badge']
    Should be True    ${sl}==1
    close browser

*** Keywords ***
Open Web With visual_user
    Open Browser    https://www.saucedemo.com/    Chrome
    Maximize Browser Window
    input text    id=user-name    visual_user
    input text    id=password    secret_sauce
    click button    id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s
