@wip @regression
Feature: Data-driven login examples

  Background:
    Given the user opens the login page

  Scenario Outline: Reject invalid login combinations
    When the user enters username "<username>"
    And the user enters password "<password>"
    And the user submits the login form
    Then the login error should contain "<expectedMessage>"

    Examples:
      | username | password       | expectedMessage             |
      | wrong    | wrong          | Your username is invalid    |
      | tomsmith | wrong-password | Your password is invalid    |
