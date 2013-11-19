Feature: Add height to profile

  Background:
    Given That a user is registered
    And I am logged in
    And I am on the edit section

  Scenario: I add the height in metric
    Then I select 182 cm as my height
    Then I see my height on the profile as metric "182" and imperial "6.0 ft"

  @javascript
  Scenario: I add the height in imperial
    Then I select "6.0" ft as my height
    Then I see my height on the profile as metric "182" and imperial "6.0 ft"

