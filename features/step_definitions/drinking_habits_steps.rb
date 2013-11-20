When(/^he selects "(.*?)"$/) do |frequency|
  select frequency, :from => 'profile_drink_frequency'
end

