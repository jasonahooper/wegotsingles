Given(/^that a man has registered$/) do
  @user = User.make!(:type => "Man")
end

Given(/^he signs in$/) do
  visit new_user_session_path
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => "password"
  click_button "Sign in"
end

Given(/^he navigates to the payment options page$/) do
  click_link "Premium Membership"
end

When(/^he enters valid card data$/) do
  customer_json = JSON(File.read('spec/fixtures/customer.json'))
  Stripe::Customer.stubs(:create).returns(customer_json)
  fill_in "Card Number", :with => "4012888888881881"
  fill_in "CVC", :with => "123"
  fill_in 'expiry_month', :with => "12"
  fill_in 'expiry_year', :with => "2015"
  click_button "Submit Payment"
end

Then(/^he is informed that his payment was successful$/) do
  assert page.find('#content').has_content?("Your payment was successful")
end

Then(/^he is unable to create a new subscription$/) do
  assert page.find('.nav-links').has_no_link?('Premium Membership')
  visit new_payment_path
  assert current_path.should eq(root_path)
  assert page.find('.notice').has_content?('You already have an active subscription.')
end

Given(/^that a man is registered with a subscription$/) do
  @user = User.make!(:with_stripe)
end

Given(/^he is on the Edit User Registration page$/) do
  visit edit_user_registration_path
end

When(/^he cancels the subscription$/) do
  mock_customer = mock
  mock_customer.stubs(:cancel_subscription)
  Stripe::Customer.expects(:retrieve).with('cus_2yc1BvwsPNa1Dn').
  returns(mock_customer)
  click_button('Cancel my subscription')
end

Then(/^he is informed the subscription is cancelled$/) do
  assert page.find('.notice').has_content?('Subscription cancelled.')
end

Then(/^he is able to create a new subscription$/) do
  assert page.find('.nav-links').has_link?('Premium Membership')
end