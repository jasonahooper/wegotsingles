Given(/^that a user is registered$/) do
  @user = Man.make!(:mr_right)
end

Given(/^there are people in the database$/) do
  10.times {Woman.make!}
  Man.make!(:mr_right)
end

Given(/^there is a matching person to the current user$/) do
  @miss_right = Woman.make!(:miss_right)
end

Given(/^the sphinx index has been built$/) do
  ThinkingSphinx::Test.start_with_autostop
end

When(/^he follows the "(.*?)" link$/) do |link|
  click_link link
end

Then(/^he will see that person$/) do
  save_and_open_page
  assert page.find("h3", :text => @miss_right.first_name )
  assert page.has_link? "My Profile", profile_user_path(@miss_right)
end
