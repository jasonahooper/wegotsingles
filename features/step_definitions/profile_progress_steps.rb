Then(/^he sees his profile progress appear as "(.*?)"$/) do |percentage|
  assert page.find('#content').has_content?(percentage)
end