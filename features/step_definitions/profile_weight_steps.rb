Then(/^I select (\d+) as my weight$/) do |weight|
    select weight, :from => "profile_metric_weight"
    click_button("Save")
end

Then(/^I see my weight on the profile as metric "(.*?)" and imperial "(.*?)"$/) do |metric, imperial|
  assert page.find('#content').should have_content metric
  assert page.find('#content').should have_content imperial
end

Then(/^I select "(.*?)" stone as my weight$/) do |weight|
  select weight, :from => "profile_imperial_weight"
  click_button("Save")
end

