Feature: Add drinking habits to profile
  @wip
  Scenario: A user adds a frequemcy but not a favourite tipple
    Given That a user is registered
    And he is on the Edit Profile page for his profile
    When he selects "weekends"
    And he click the "Save" button
    Then he will see "weekends"
        
  Scenario: A user adds their drinking habits to their profile
    Given That a user is registered
    And he is on the Edit Profile page for his profile
    When he selects "weekends"
    And he enters "Mojito" into the "Favourite tipple"
    And he click the "Save" button
    Then he will see "weekends"
    And he will see "Mojito"

