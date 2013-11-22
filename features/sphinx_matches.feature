Feature: Find matching profiles
  Background: 
    Given that a user is registered
    And he signs in
  Scenario: A user views their matches
    Given there are people in the database
    And there is a matching person to the current user
    And the sphinx index has been built
    When he follows the "My Matches" link
    Then he will see that person
