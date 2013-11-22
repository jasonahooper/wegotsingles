Given(/^there is already another user that has been registered on the page$/) do
  @sally = Woman.make!(:email => "sally@email.com")
end

Then(/^he replies one message with subject "(.*?)"$/) do |subject|
  click_link(subject)
end

When(/^he fills the message with "(.*?)" as subject and "(.*?)"$/) do |subject, body|
  fill_in 'Subject', :with => subject
  fill_in 'Body', :with => body
  click_button("Send Reply")
end

Then(/^he should see his message in the sent items$/) do
  assert page.find('#content').should have_content "Cute Monkey"
end

