Feature: Send Message

  Background:
    Given that Sally has registered previously on the website
    And That a user is registered
    And I am logged in
    And I am on her profile
  
  Scenario: A user sends a message
    When her sends her a romantic message
    Then the message appears in her inbox