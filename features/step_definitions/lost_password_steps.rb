Given(/^That a user is registered$/) do
  @user = User.make!
end

Given(/^they are on the sign\-in page$/) do
  visit new_user_session_path
end

When(/^they click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^an email is sent$/) do
  @outbox = ActionMailer::Base.deliveries
  @outbox.length.should eq(1)
end

Then(/^it is addressed to the user$/) do
  @outbox.first.to.should include(@user.email)
end

Then(/^it contains the users first name$/) do
  @outbox.first.body.encoded.should match (@user.first_name)  
end