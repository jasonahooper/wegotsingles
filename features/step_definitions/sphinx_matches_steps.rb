Given(/^that a user is registered$/) do
  @user = Man.make!(:mr_right)
end

Given(/^there are people in the database$/) do
  10.times {Woman.make!(:email => Faker::Internet.email,
    :first_name => Faker::Name.first_name)}
  Man.make!(:mr_right)
  # 10.times {Woman.make!(:email => Faker::Internet.email)}
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
  assert page.has_link? "My Profile", :href => profile_user_path(@miss_right)
end

Given(/^there is a matching person far away$/) do
  @far_miss_right = Woman.make!(:miss_right, :lat => 55, :lng => 5,
    :first_name => 'Far Miss Right')
end

Then(/^he will see the close person$/) do
  assert 1, page.all("h3", :text => @miss_right.first_name ).count
  assert page.has_link? "My Profile", :href => profile_user_path(@miss_right)
end

Then(/^he will not see the far person$/) do
  assert !page.has_link?("My Profile", :href => profile_user_path(@far_miss_right))
end
