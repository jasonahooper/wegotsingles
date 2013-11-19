Given(/^I have a profile$/) do
  @profile = Profile.make!
end

Given(/^I have ethnicity "(.*?)"$/) do |ethnicity|
  Ethnicity.make!(:ethnicity => ethnicity)
end

Given(/^I am on the Edit Profile page for that profile$/) do
  visit edit_profile_path(@profile)
end

When(/^I select "(.*?)"$/) do |selection|
  check selection
end

When(/^I click "(.*?)"$/) do |button|
  click_button button
end

Then(/^I will see "(.*?)" selected$/) do |item|
  assert page.find('#profile-ethnicities').has_content?(item)
end