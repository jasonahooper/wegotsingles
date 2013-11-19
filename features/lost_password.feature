Feature: Lost Password

  Scenario: A user resets a forgotten password
    Given That a user is registered
    And they are on the sign-in page
    When they click "Forgot your password?"
    And he enters "john.smith@email.com" into the "Email"
    And he click the "Send me reset password instructions" button
    Then an email is sent
    And it is addressed to the user
    And it contains the users first name