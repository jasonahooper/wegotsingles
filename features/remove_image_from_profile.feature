Feature: Remove images from profile

  Background:
    Given That a user is registered
    And he has a profile with an image
    And he is on the Edit Profile page for his profile

  Scenario: A user removes an image from their profile
    When he selects the first image for deletion
    And he click the "Save" button
    Then he will see "0" images
