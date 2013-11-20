Given(/^the following languages exist:$/) do |language|
  language.hashes.each do |e|
    Language.make!(e)
  end
end

Given(/^he has a profile with language "(.*?)"$/) do |language|
  @user.profile.languages << Language.find_by_language(language)
end