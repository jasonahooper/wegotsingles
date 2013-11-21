Feature: Add education to profile
  Background:
    Given That a user is registered
    And I am logged in
    And I am on the edit section

  Scenario: A man selects his education
    Then I select "Bachelor's Degree"
    Then I see my "Bachelor's Degree" as education on my profile
