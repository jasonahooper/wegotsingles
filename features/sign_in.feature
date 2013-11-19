Feature: Sign in
  Scenario: A Regsitstered User signs in
    Given That a user is registered
    And they are on the sign-in page
    When he enters "john.smith@email.com" into the "Email"
    And he enters "password" into the "Password"
    And he click the "Sign in" button
    Then he should be taken to the homepage
  
  Scenario: An Unregsitstered User signs in
    Given they are on the sign-in page
    When he enters "not_a_user@email.com" into the "Email"
    And he enters "not_a_password" into the "Password"
    And he click the "Sign in" button
    Then he should be returned to the login page