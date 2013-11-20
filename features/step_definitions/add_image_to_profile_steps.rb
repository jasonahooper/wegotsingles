When(/^he selects the image file "(.*?)"$/) do |file|
  attach_file('Image', 'spec/fixtures/' + file)
end

Then(/^he will see alt "(.*?)"$/) do |alt|
  page.should have_xpath("//img[@alt=\"#{alt}\"]")
end

Given(/^he has a profile with an image$/) do
  @user.profile.images << Image.new(:image => "first.jpg")
end

Then(/^he will see "(.*?)" image(?:|s)$/) do |count|
  page.all("img").count.should eq count.to_i
end
