Then(/^he will see "(.*?)"$/) do |content|
  binding.pry
  assert page.find('#content').has_content?(content)
end