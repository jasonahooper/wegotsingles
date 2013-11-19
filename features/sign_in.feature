Feature: Sign in
  Scenario: A Regsitstered USer signs in
    Given That a user is registered
    And they are on the sign-in page
    When he enters "john.smith@email.com" into the "Email"
    And he enters "password" into the "Password"
    And he click the "Sign in" button
    Then he should be taken to the homepage
