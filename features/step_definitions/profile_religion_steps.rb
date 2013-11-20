When(/^he select a "(.*?)" and "(.*?)"$/) do |religion, interest|
  within('.religion') do
    select religion, :from => 'profile_religion'
    select interest, :from => 'profile_religion_interest_level'
  end
end
