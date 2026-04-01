*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://automationexercise.com/login
${CART_URL}    https://automationexercise.com/view_cart
${BROWSER}     Chrome
${EMAIL}       testuserproject01@gmail.com
${PASSWORD}    Testdemo@123

*** Test Cases ***
Checkout 1 Product
# 1. Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

# 2. Locate Email and Password
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    ${EMAIL}
    Input Password    name=password    ${PASSWORD}

# 3. Click Login Button
    Click Element    css:[data-qa="login-button"]

# 4. RESET CART
    # 4.1 Go to cart page
    Execute Javascript    window.location.href='${CART_URL}'
    Wait Until Location Is    ${CART_URL}    15s

    # 4.2 Pre-emptively clear cart items added from previous tests
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath://td[@class="cart_delete"]//a[@data-product-id="1"]    3s
    Run Keyword And Ignore Error    Click Element    xpath://td[@class="cart_delete"]//a[@data-product-id="1"] 
    
    # 4.3. Go back to home page to start shopping flow
    Go To    https://automationexercise.com/
    Wait Until Element Is Visible    xpath://p[text()="Blue Top"]
    Scroll Element Into View         xpath://p[text()="Blue Top"]

# 5. Scroll product name to center of screen
    ${element}=    Get WebElement    xpath://p[text()="Blue Top"]
    Execute Javascript    arguments[0].scrollIntoView({block: "center"});    ARGUMENTS    ${element}

# 6. Hover mouse over desired product and click Add To Cart
    Mouse Over    xpath://p[text()="Blue Top"]
    Sleep    1s
    Click Element    xpath:(//a[@data-product-id="1"])[2]

# 7. Wait for View Cart link to appear
    Wait Until Element Is Visible    link:View Cart    10s
    Click Element                    link:View Cart

# 8. Wait for cart table to load
    Wait Until Element Is Visible    id:cart_info_table    10s

# 9. Verify Total amount is Rs. 500
    Wait Until Element Is Visible    xpath://p[@class='cart_total_price' and text()='Rs. 500']    15s