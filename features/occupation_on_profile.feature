Feature: a user specifies their occupation on the profile

  Scenario: a user enters occupation on their profile
  Given That a user is registered
  And he is on the Edit Profile page for his profile
  When he enters "Developer" into the "Occupation"
  And he click the "Save" button
  Then he will see "Developer"
  And he will see "Occupation"