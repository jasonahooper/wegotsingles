Feature: Premium Membership

  Scenario: A man pays for a monthly subscription
    Given that a man has registered
    And he signs in
    And he navigates to the payment options page
    When he enters valid card data
    Then he is informed that his payment was successful
    And he is unable to create a new subscription

  Scenario: A man cancels an active subscription
    Given that a man is registered with a subscription
    And he signs in
    And he is on the Edit User Registration page
    When he cancels the subscription
    Then he is informed the subscription is cancelled
    And he is able to create a new subscription
