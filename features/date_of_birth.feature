Feature: Date of Birth

  Scenario: A user enters his date of birth on registration sees this on his profile
    Given That a man is on the registration page
    When he completes the registration form with valid data
    And he click the "Sign up" button
    When he visits his profile page
    Then he should see his date of birth displayed 