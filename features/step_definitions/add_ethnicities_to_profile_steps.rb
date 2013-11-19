Given(/^I have a profile$/) do
  @profile = Profile.make!
end

Given(/^the following ethnicities exist:$/) do |ethnicity|
  ethnicity.hashes.each do |e|
    Ethnicity.make!(e)
  end
end

Given(/^I am on the Edit Profile page for that profile$/) do
  visit edit_profile_path(@profile)
end

When(/^I check "(.*?)"$/) do |selection|
  check selection
end

When(/^I uncheck "(.*?)"$/) do |selection|
  uncheck selection
end

When(/^I click "(.*?)"$/) do |button|
  click_button button
end

Then(/^I will see "(.*?)" selected$/) do |item|
  assert page.find('#profile-ethnicities').has_content?(item)
end

Given(/^I have a profile with ethnicity "(.*?)"$/) do |ethnicity|
  step 'I have a profile'
  @profile.ethnicities << Ethnicity.find_by_ethnicity(ethnicity)
end