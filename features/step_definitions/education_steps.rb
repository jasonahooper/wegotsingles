Then(/^I select "(.*?)"$/) do |education|
  select education, :from => "profile_education"
  click_button("Save")
end

Then(/^I see my "(.*?)" as education on my profile$/) do |education|
  assert page.find('#content').should have_content education
  save_and_open_page
end
