# Automation-Exercise-Robot-Selenium 🛒

A robust End-to-End (E2E) automation project built with **Robot Framework** and **SeleniumLibrary**. This suite validates the full user journey on [Automation Exercise](https://automationexercise.com/), specifically focusing on login, cart state management, and price verification.

## 📋 Test Scenario: One-Product Checkout Flow (UAT)
This scenario validates the core "Add to Cart" business logic while ensuring test environmental stability.

**Pre-conditions:** * User has a registered account.
* Browser is maximized for consistent element visibility.

### **Steps & Verifications:**
1. **Secure Login:** Authenticate using pre-defined credentials via the Login page.
2. **State Reset (Cart Cleanup):** Navigate to the cart to ensure a zero balance, preventing data from previous sessions.
   > **ER-1:** Cart displays "Cart is empty!" and the total is **Rs. 0**.
3. **Product Discovery:** Search for the "Blue Top" on the homepage and scroll the element to the center of the viewport.
4. **Dynamic Interaction:** Trigger the hover overlay and add the product to the cart using its specific product ID.
5. **Cart Navigation:** Transition from the homepage to the Cart View.
6. **Price Validation:** Verify the total amount matches the expected value (**Rs. 500**).
   > **ER-2:** The item "Blue Top" is successfully listed and the final checkout price is exactly **Rs. 500**.

## 🌟 Key Engineering Highlights
Most automation scripts fail due to "flaky" UI or persistent data. This project implements specific solutions for these real-world hurdles:
* **State Management (Cart Reset):** Implemented a pre-test cleanup keyword to ensure **Test Isolation** and accurate price verification every time.
* **Viewport Handling:** Used **JavaScript `scrollIntoView({block: "center"})`** to ensure product elements are perfectly centered, preventing "Element Not Interactable" errors.
* **Dynamic UI Interaction:** Leveraged `Mouse Over` and XPath indexing to handle hidden hover-overlays, mimicking realistic user behavior.

## 🛠️ Tech Stack
* **Framework:** Robot Framework
* **Library:** SeleniumLibrary
* **Language:** Python
* **Drivers:** Chrome WebDriver

---

## 🚀 Getting Started

### Installation
1. Clone the repo:
   ```bash
   git clone [https://github.com/nawapats/Automation-Exercise-Robot-Selenium](https://github.com/nawapats/Automation-Exercise-Robot-Selenium)
2. Install Dependencies
   ```bash
   pip install -r requirements.txt
3. How to Run. 
To execute the test and save results in a dedicated folder:
   ```bash
   robot -d Results "Tests/robot test.robot"

## 📊 Execution Results

To ensure transparency and demonstrate the stability of the script, below is a live recording of the automation execution.

![Checkout Automation Demo](./assets/execution_demo.gif)

### **Validation Summary**
The following assertions are validated during every run to ensure 100% functional integrity:
- [x] **Login Success:** Verified by successful redirection to the user homepage.
- [x] **State Reset:** Confirmed by "Cart is empty!" message and Rs. 0 balance (ER-1).
- [x] **Add to Cart:** Verified by the success modal and dynamic header update.
- [x] **Price Integrity:** Final total confirmed as exactly **Rs. 500** (ER-2).