Feature: create man

  Scenario: A man signs up 
    Given That a man is on the registration page
    When he enters "john.smith@email.com" into the "Email"
    And he enters "password" into the "Password"
    And he enters "password" into the "Password confirmation"
    And he click the "Sign up" button
    Then it should make a man
    Then he should be taken to the new profile page