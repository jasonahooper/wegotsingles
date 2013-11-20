Rails.configuration.stripe = {
  :publishable_key => "pk_test_QZ6J7qOKcnLpRsnQtXQEzOSd",
  :secret_key      => "sk_test_8giNo2HZD7kAmStxV9cTULDg"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]