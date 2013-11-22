Feature: User selects image as his main image

  Background:
    Given That a user is registered
    And I am logged in
    And that he has more than one image
    And I am on the edit section

  Scenario: He selects the image and he see it as profile image
    And he selects one of those images as his profile image
    Then he sees the selected image on the profile page as his profile image
