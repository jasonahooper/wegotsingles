
Given(/^That a man is on the registration page$/) do
  visit account_registration_path("Man")
end

Given(/^That a woman is on the registration page$/) do
  visit account_registration_path("Woman")
end

When(/^(?:|s)he completes the registration form with valid data$/) do
  step 'he enters "john.smith@email.com" into the "Email"'
  step 'he enters "password" into the "Password"'
  step 'he enters "password" into the "Password confirmation"'
  step 'he enters "Smithy87" into the "Username"'
  step 'he enters "John" into the "First name"'
end

When(/^(?:|s)he enters "(.*?)" into the "(.*?)"$/) do |input, input_field|
  fill_in input_field, :with => input
end

When(/^(?:|s)he click the "(.*?)" button$/) do |button|
  click_button button
end

Then(/^it should make a man$/) do
  expect(Man.count).to eq(1)
end

Then(/^(?:|s)he should be taken to the new profile page$/) do
  assert page.find("h1", :text => "We Got Singles")
end

Then(/^it should make a woman$/) do
  expect(Woman.count).to eq(1)
end

Then(/^the email should contain a confirmation link$/) do
  @outbox.first.body.encoded.should match ("Confirm my account")
end

