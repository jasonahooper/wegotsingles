Then(/^he should be taken to the homepage$/) do
  current_path.should eq(root_path)
end
