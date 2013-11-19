Feature: Add height to profile

  Background:
    Given that I have a profile
    And I am on the edit section
    And That a user is registered

  @wip
  Scenario: I add the height in metric
    Then I select 182 cm as my height
    Then I see my height on the profile as metric (182) and imperial (6.0)

  Scenario: I add the height in imperial
    Then I select 6.0 ft as my height
    Then I see my height on the profile as metric (182) and imperial (6.0)

