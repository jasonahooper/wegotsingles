Given(/^that Sally has registered previously on the website$/) do
  @sally = User.make!(:different_user)
end

Given(/^I am on her profile$/) do
  visit user_profile_path(@sally, @sally.profile)
end

When(/^her sends her a romantic message$/) do
  fill_in "Subject", :with => "Hello"
  fill_in "Body", :with => "Lets go for a long walk on the beach."
  click_button "Send"
end

Then(/^the message appears in her inbox$/) do
  assert_equal @sally.reload.received_messages.count, 1
end