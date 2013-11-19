Given(/^the following languages exist:$/) do |language|
  language.hashes.each do |e|
    Language.make!(e)
  end
end
