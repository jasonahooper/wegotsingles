Feature: Reply a message

  Background:
    Given That a user is registered
    And I am logged in
    And has previous messages received
    Then He is on the messages dashboard

  @javascript
  Scenario: He replies a message from his inbox
    Then he sees all the messages that has in his inbox
    Then he replies one message with subject "Hellou"
    When he fills the message with "Cute Monkey" as subject and "Here is the link of a monkey page"
    Then he should see his message in the sent items