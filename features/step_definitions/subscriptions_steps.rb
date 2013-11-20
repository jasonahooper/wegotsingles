Given(/^that a man has registered$/) do
  @user = User.make!(:type => "Man")
end

Given(/^he enters signs in$/) do
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
  fill_in "Card Number", :with => "1234 1234 1234 1234"
  fill_in "CVC", :with => "123"
  fill_in "month", :with => "12"
  fill_in "year", :with => "2015"
  click_button "Submit Payment"
end

Then(/^he is informed that his payment was successful$/) do
  save_and_open_page
  assert page.find('#content').has_content?("Your payment was successful")
end
