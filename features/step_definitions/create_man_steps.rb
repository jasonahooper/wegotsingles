
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
  User.make!
end

When(/^they click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^an email is sent$/) do
  pending # express the regexp above with the code you wish you had
end

