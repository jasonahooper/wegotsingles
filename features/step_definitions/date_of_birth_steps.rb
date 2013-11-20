When(/^he visits his profile page$/) do
  @man = Man.first
  visit user_profile_path(@man, @man.profile)
end

Then(/^he should see his date of birth displayed$/) do
  assert page.find(".date_of_birth", "1995-11-20")
end