Given(/^that a user is on the edit page$/) do
  @user = User.make!
  visit edit_user_profile_path(@user, @user.profile)
end

When(/^he selects "(.*?)" from "(.*?)"$/) do |selection, options|
  select selection, :from => options
end

When(/^clicks the "(.*?)" button$/) do |save|
  click_button save
end
