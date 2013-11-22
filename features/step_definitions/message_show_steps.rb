Given(/^that he clicks on a message subject$/) do
  click_link("Hellou")
end

Then(/^he sees the subject on the page "(.*?)"$/) do |subject|
  assert page.find('#content').has_content?(subject)
end

Then(/^he sees "(.*?)" as body in the page$/) do |body|
  assert page.find('#content').has_content?(body)
end

