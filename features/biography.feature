Feature: A man adds his biography

  Background:
    Given That a user is registered
    And I am logged in
    And I am on the edit section

  Scenario: He fills in the about you section
    When he enters "I am a person" into the "About you"
    And he click the "Save" button
    Then he will see "I am a person"

  Scenario: He fills in the about you section
    When he enters "I like monkeys" into the "Likes and dislikes"
    And he click the "Save" button
    Then he will see "I like monkeys"

  Scenario: He fills in the about you section
    When he enters "I look for some girl" into the "Looking for"
    And he click the "Save" button
    Then he will see "I look for some girl"