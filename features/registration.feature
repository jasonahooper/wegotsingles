Feature: Registration

  Scenario: A man signs up 
    Given That a man is on the registration page
    When he completes the registration form with valid data
    And he click the "Sign up" button
    Then it should make a man
    Then he should be taken to the new profile page

  Scenario: A woman signs up
    Given That a woman is on the registration page
    When she completes the registration form with valid data
    And she click the "Sign up" button
    Then it should make a woman
    Then she should be taken to the new profile page

  Scenario: A user recieves a email confirmation link upon signing up
    Given That a man is on the registration page
    When he completes the registration form with valid data
    And he click the "Sign up" button
    Then an email is sent
    And the email should contain a confirmation link