Given(/^that he has more than one image$/) do
  @image1 = Image.make(:with_file)
  @image2 = Image.make(:with_file)
  @user.profile.images << @image1
  @user.profile.images << @image2
  @user.save!
end

Given(/^he selects one of those images as his profile image$/) do
  choose("profile_main_image_id_#{@image2.id}")
  click_button("Save")
end

Then(/^he sees the selected image on the profile page as his profile image$/) do
  save_and_open_page
  assert find("#main_image")
end




