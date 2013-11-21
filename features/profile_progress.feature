Feature: Profile progress

   Background:
    Given That a user is registered
    And I am logged in
    And I am on the edit section

  Scenario: A users adds information to their profile and it increments their profile progress
    When he selects "Never" from "profile_smoking_habits"
    And clicks the "Save" button
    When I am on the edit section
    Then he sees his profile progress appear as "6 percent"