When(/^he selects a "(.*?)" and "(.*?)"$/) do |sign, interest|
  within('.star_sign') do
    select sign, :from => 'profile_star_sign'
    select interest, :from => 'profile_star_sign_interest_level'
  end
end
