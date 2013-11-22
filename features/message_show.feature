Feature: Show message

  Background:
    Given That a user is registered
    And I am logged in
    And has previous messages received
    Then He is on the messages dashboard

  @wip
  Scenario: Sees full body message
    Given that he clicks on a message subject
    Then he sees the subject on the page "Hellou"
    And he sees "Do you like monkeys?" as body in the page