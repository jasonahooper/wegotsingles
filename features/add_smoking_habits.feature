Feature: Add Smoking Habits

  Scenario: A user specifies that they do not smoke
    Given that a user is on the edit page
    When he selects "Never" from "profile_smoking_habits"
    And clicks the "Save" button
    Then he will see "Never"