Given(/^the following ethnicities exist:$/) do |ethnicity|
  ethnicity.hashes.each do |e|
    Ethnicity.make!(e)
  end
end

Given(/^he is on the Edit Profile page for his profile$/) do
  visit edit_user_profile_path(@user, @user.profile)
end

When(/^he checks "(.*?)"$/) do |selection|
  check selection
end

When(/^he unchecks "(.*?)"$/) do |selection|
  uncheck selection
end

When(/^I click "(.*?)"$/) do |button|
  click_button button
end

Then(/^he will see "(.*?)" selected$/) do |item|
  assert page.find('#profile-ethnicities').has_content?(item)
end

Given(/^he has a profile with ethnicity "(.*?)"$/) do |ethnicity|
  @user.profile.ethnicities << Ethnicity.find_by_ethnicity(ethnicity)
end