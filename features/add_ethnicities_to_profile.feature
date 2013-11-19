Feature: add ethnicity to profile

  Scenario: a user adds ethnicity to their profile
  Given I have a profile
  And I have ethnicity "White"
  And I have ethnicity "African"
  And I am on the Edit Profile page for that profile
  When I select "White"
  And I select "African"
  And I click "Save"
  Then I will see "White" selected
  And I will see "African" selected