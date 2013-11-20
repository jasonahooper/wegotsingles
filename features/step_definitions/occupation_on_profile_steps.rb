Then(/^he will see "(.*?)"$/) do |content|
  assert page.find('#content').has_content?(content)
end