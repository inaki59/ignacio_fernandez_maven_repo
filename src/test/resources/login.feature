#login

Feature:  validate  login test suite
Background: Navigate to the home page
Given the user is on the home page

Scenario Outline: Verify valid user can login
And the user provides the username "{{ username }}" and password "{{ password }}"
When the user clicks the login button
Then the user is logged successfully and is into the inventory page

Examples:
| username | password |
| ------- | -------- |
| I       | password |
| standard_user | secret sauce |

Scenario Outline: message error for  incorrect login
And the user provides the username "{{ standard_userr }}" and password "{{ password }}"
When the user clicks the login button
Then the user is logged unsuccessfully and appear message error login
  Examples:
    |  |

# inventory
Feature:inventory
Background:
  Given navigate website  https://www.saucedemo.com
  And the user provides the username "{{ username }}" and password "{{ password }}"
  And  Click on the Login button login
  Scenario Outline :Validate that the number of results is 6

  When the user clicks the login button
  Then   Let's go to the inventory page and check that we have 6 products
    Examples:
      |cup| stock |
      |summer cup|6|

Scenario  : Validate that the Sauce Labs Bolt T-Shirt product exists in inventory
When the user clicks the login button
  Then Validate that the Sauce Labs Bolt T-Shirt product appears in inventory.


  Scenario: Add the product Sauce Labs Bolt T-Shirt to cart:
    When the user clicks the login button
    And navigate homepage
    And found  o Sauce Labs Bolt T-Shirt
    And press button add to cart
    Then The cart will appear in the menu with the number of items added (1 product)


    Scenario: Remove product from cart from inventory
      When the user clicks the login button
      And found  o Sauce Labs Bolt T-Shirt
      And press button add to cart
      And press button navbar cart
      And the list of products will appear
      And We will press the x button to delete the product
      Then  the product has disappeared and the item will go to -1
      Scenario: Add to cart 3 products
        When the user clicks the login button
        And navigate homepage
        And found  o Sauce Labs Bolt T-Shirt
        And press button add to cart
        And  found  black cup
        And press button add to cart
        And found runner shoes
        And press button add to cart
        Then We will see the cart with a symbol with the product number in this case 3


        Scenario: Sort inventory alphabetically (Z to A)
          When  the user clicks the login button
          And click button sort
          And We choose the option to order from z to A
          Then The list of products will be shown to us in a different order low to high

        Scenario:  Sort inventory by price from Lowest to Highest
          When  the user clicks the login button
          And click button sort
          And We choose the option to order low to high
          Then The list of products will be shown to us in a different order price from Lowest to Highest

        Scenario: Delete product from cart
          When the user clicks the login button
          Then the user is logged in successfully and sees the inventory page
          And the user adds two randomly selected products to the cart
          And the user navigates to the shopping cart
          When the user removes one of the products from the cart
          Then the user is redirected to the updated shopping cart
          And the removed product is no longer displayed in the cart
          And the total cart price is updated accordingly




          Scenario: Check the final Checkout price of several products
            And the user adds three randomly selected products to the cart
            And the user navigates to the shopping cart
            When the user initiates the checkout process
            Then the user is directed to the checkout page
            And the user enters valid checkout information
            And the user proceeds to the next step of the checkout process
            When the user reaches the final checkout page
            Then the user is presented with the order summary
            And the displayed order total (Item Total) matches the sum of the individual product prices selected from the inventory

          Scenario: Place an order
            When  The user adds one product to the cart.
            And The user navigates to the shopping cart.
            When  The user initiates the checkout process.
            Then  The checkout page is displayed.
            And The user enters checkout information.
            And The user proceeds to the next step.
            When  The final checkout page is displayed.
            And The user completes the checkout.
            Then  The confirmation message is displayed.
            And The message indicates successful order completion.
            And The specific success message is displayed.

          Scenario: Logout
            When the user clicks the login button
            Then the user is logged in successfully and sees the inventory page
            And the user clicks the logout button
            Then the user is redirected to the login page
            And the user is able to enter new credentials and log in again
