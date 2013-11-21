When(/^he selects the first image for deletion$/) do
  check "profile[images_attributes][0][_destroy]"
end