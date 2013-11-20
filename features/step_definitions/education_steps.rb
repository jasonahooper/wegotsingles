Then(/^I select "(.*?)"$/) do |education|
  select education, :from => "profile_education"
end

Then(/^I see my "(.*?)" as education on my profile$/) do |education|
  assert page.find('#content').should have_content education
end
