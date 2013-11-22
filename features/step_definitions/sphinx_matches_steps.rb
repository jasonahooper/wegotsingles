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
  assert page.find("h3", :text => @miss_right.first_name )
  assert page.has_link? "My Profile", profile_user_path(@miss_right)
end

Given(/^there is a matching person far away$/) do
  @far_miss_right = Woman.make!(:miss_right, :lat => 53, :lng => 2)
end

Then(/^he will see the close person$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^he will not see the far person$/) do
  pending # express the regexp above with the code you wish you had
end