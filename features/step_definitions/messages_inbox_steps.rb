Then(/^has previous messages received$/) do

  @user.received_messages << Message.make!(:subject => "Hellou", :body => "Do you like monkeys?", :from => User.make!(:different_user))
  @user.received_messages << Message.make!(:subject => "Hola", :body => "Monkeys in the night...", :from => User.make!(:first_name => "Julia", :email => "Julia@email.com"))
  @user.received_messages << Message.make!(:subject => "Hallo", :body => "Monkeys bananas!", :from => User.make!(:first_name => "Maria", :email => "Maria@email.com"))
  @user.save!
end

Then(/^He is on the messages dashboard$/) do
  visit messages_path
end

Then(/^he sees all the messages that has in his inbox$/) do
  assert page.find('#content').has_content?('Sally')
  assert page.find('#content').has_content?('Julia')
  assert page.find('#content').has_content?('Maria')
end

Then(/^he reads a message subject from sally that says "(.*?)"$/) do |subject|
  assert page.find('#content').has_content?(subject)
end