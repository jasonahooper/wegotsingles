Given(/^that a user is registered$/) do
  @user = Man.make!(:mr_right)
end

Given(/^there are people in the database$/) do
  10.times {Woman.make!}
end

Given(/^there is a matching person to the current user$/) do
  Woman.make!(:miss_right)
end

Given(/^the sphinx index has been built$/) do
  ThinkingSphinx::Test.start_with_autostop
end

When(/^he follows the "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^he will see that person$/) do
  pending # express the regexp above with the code you wish you had
end
