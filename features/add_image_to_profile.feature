Feature: Add images to profile

  Background:
    Given That a user is registered
    And he is on the Edit Profile page for his profile

  Scenario: A user adds an image to their empty profile
    When he selects the image file "gary.jpg"
    And he click the "Save" button
    Then he will see "1" image
    And he will see alt "Thumb gary"

  Scenario: A user adds an additional image to their profile
    Given he has a profile with an image
    When he selects the image file "gary.jpg"
    And he click the "Save" button
    Then he will see "2" images
    And he will see alt "Thumb gary"
