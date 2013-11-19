Feature: add languages to profile

  Background:
    Given the following languages exist:
      | language |
      | English  |
      | Spanish  |
      | French   |
    And That a user is registered

  Scenario: a user adds language(s) to their profile
    Given he is on the Edit Profile page for his profile
    When he checks "English"
    And he checks "French"
    And he click the "Save" button
    Then he will see "English" selected
    And he will see "French" selected

  Scenario: a user changes languages on their profile
    Given he has a profile with language "Spanish"
    And he is on the Edit Profile page for his profile
    When he checks "English"
    And he unchecks "Spanish"
    And he click the "Save" button
    Then he will see "English" selected