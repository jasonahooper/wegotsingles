Given(/^I am on the edit section$/) do
  visit edit_user_profile_path(@user, @user.profile)
end

Given(/^I am logged in$/) do
    step "they are on the sign-in page"
    step "he enters \"#{@user.email}\" into the \"Email\""
    step "he enters \"password\" into the \"Password\""
    step "he click the \"Sign in\" button"
end

Then(/^I select (\d+) cm as my height$/) do |height|
  select height, :from => "profile_metric_height"
  click_button("Save")
end

Then(/^I see my height on the profile as metric "(.*?)" and imperial "(.*?)"$/) do |metric, imperial|
    assert page.find('#content').should have_content metric
    assert page.find('#content').should have_content imperial
end
