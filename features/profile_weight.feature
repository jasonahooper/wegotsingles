Feature: Add weight to profile

  Background:
    Given That a user is registered
    And I am logged in
    And I am on the edit section


  Scenario: I add the weight in metric
    Then I select 80 as my weight
    Then I see my weight on the profile as metric "80" and imperial "12.6"

  @javascript
  Scenario: I add the weight in imperial
    Then I select "12.6" stone as my weight
    Then I see my weight on the profile as metric "80" and imperial "12.6"

