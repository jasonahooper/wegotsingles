Given(/^that I have a profile$/) do
  @user = User.make!
  @profile = Profile.make!
end

Given(/^I am on the edit section$/) do
  visit edit_user_profile_path(@user, @profile)
end

Then(/^I select (\d+) cm as my height$/) do |height|
  select height, :from => "profile_height"
  click_button("Submit")
  save_and_open_page
end

Then(/^I see my height on the profile as metric \((\d+)\) and imperial \((\d+)\.(\d+)\)$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end
