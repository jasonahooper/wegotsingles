Feature: Premium Membership

  Scenario: A man pays for a monthly subscription
    Given that a man has registered
    And he enters signs in
    And he navigates to the payment options page
    When he enters valid card data
    Then he is informed that his payment was successful
    