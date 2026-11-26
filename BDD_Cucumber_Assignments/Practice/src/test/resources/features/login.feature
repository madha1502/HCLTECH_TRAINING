@regression
Feature: Login functionality

  Background:
    Given the user opens the login page

  @smoke @positive
  Scenario: Login with valid credentials
    When the user enters username "tomsmith"
    And the user enters password "SuperSecretPassword!"
    And the user submits the login form
    Then the secure area should be displayed

  @negative
  Scenario: Login with an invalid password
    When the user enters username "tomsmith"
    And the user enters password "wrong-password"
    And the user submits the login form
    Then the login error should contain "Your password is invalid"

  @smoke
  Scenario: Logout after successful login
    When the user enters username "tomsmith"
    And the user enters password "SuperSecretPassword!"
    And the user submits the login form
    Then the secure area should be displayed
    When the user logs out
    Then the logout confirmation should contain "You logged out"
