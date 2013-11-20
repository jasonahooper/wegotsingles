Then(/^he will see "(.*?)"$/) do |content|
  assert page.find('#content').has_content?(content)
  save_and_open_page
end