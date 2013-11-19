
Feature: create man
  Scenario: A man signs up 
    Given That a man is on the registration page
    When he enters "john.smith@email.com" into the "Email"
    And he enters "password" into the "Password"
    And he enters "password" into the "Password confirmation"
    And he enters "John" into the "First name"
    And he click the "Sign up" button
    Then it should make a man
    Then he should be taken to the new profile page

  Scenario: A user resets a forgotten password
    Given That a user is registered
    And they are on the sign-in page
    When they click "Forgot your password?"
    And he enters "john.smith@email.com" into the "Email"
    And he click the "Send me reset password instructions" button
    Then an email is sent
    And it is addressed to the user
    And it contains the users first name