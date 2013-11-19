Feature: add zodiac sign to profile

  Scenario: A user adds her star sign to their profile
    Given That a user is registered
    And he is on the Edit Profile page for his profile
    When he selects a "Aquarius" and "Not interested"
    And he click the "Save" button
    Then he will see "Star-sign: Aquarius, and I'm not interested"
