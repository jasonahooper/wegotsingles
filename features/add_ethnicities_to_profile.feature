Feature: add ethnicity to profile

  Background:
    Given the following ethnicities exist:
      | ethnicity |
      | White     |
      | African   |
      | Spanish   |
    And That a user is registered

  Scenario: a user adds ethnicity to their profile
  Given I am on the Edit Profile page for that profile
  When I check "White"
  And I check "African"
  And I click "Save"
  Then I will see "White" selected
  And I will see "African" selected

  Scenario: a user changes ethnicity on their profile
  Given I have a profile with ethnicity "African"
  And I am on the Edit Profile page for that profile
  When I check "Spanish"
  And I uncheck "African"
  And I click "Save"
  Then I will see "Spanish" selected