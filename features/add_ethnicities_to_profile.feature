Feature: add ethnicity to profile

  Background:
    Given the following ethnicities exist:
      | ethnicity |
      | White     |
      | African   |
      | Spanish   |
    And That a user is registered

  Scenario: a user adds ethnicity to their profile
  Given he is on the Edit Profile page for his profile
  When he checks "White"
  And he checks "African"
  And he click the "Save" button
  Then he will see "White" selected
  And he will see "African" selected

  Scenario: a user changes ethnicity on their profile
  Given he has a profile with ethnicity "African"
  And he is on the Edit Profile page for his profile
  When he checks "Spanish"
  And he unchecks "African"
  And he click the "Save" button
  Then he will see "Spanish" selected