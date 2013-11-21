Feature: Adds religion feature

  Scenario: A user adds his religion to their profile
    Given That a user is registered
    And he is on the Edit Profile page for his profile
    When he select a "Buddism" and "Very interested"
    And he click the "Save" button
    Then he will see "Buddism"
    And he will see "very interested"