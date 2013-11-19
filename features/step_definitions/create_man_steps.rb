
Given(/^That a man is on the registration page$/) do
  visit account_registration_path("Man")
end

When(/^he enters "(.*?)" into the "(.*?)"$/) do |input, input_field|
  fill_in input_field, :with => input
end

When(/^he click the "(.*?)" button$/) do |button|
  click_button button
end

Then(/^it should make a man$/) do
  expect(Man.count).to eq(1)
end

Then(/^he should be taken to the new profile page$/) do
  assert page.find("h1", :text => "We Got Singles")
end

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
