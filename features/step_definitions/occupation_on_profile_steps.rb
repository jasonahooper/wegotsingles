Then(/^he will see "(.*?)"$/) do |content|
  page.find('#content').has_content?(content)
end