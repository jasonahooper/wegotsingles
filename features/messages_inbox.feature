Feature: Inbox

  Background:
    Given That a user is registered
    And I am logged in
    And has previous messages received
    Then He is on the messages dashboard

  Scenario: A user reads his messages
    Then he sees all the messages that has in his inbox
    And he reads a message subject from sally that says "Hellou"
