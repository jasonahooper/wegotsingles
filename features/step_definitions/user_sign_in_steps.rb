Then(/^he should be taken to the homepage$/) do
  current_path.should eq(root_path)
end

Then(/^he should be returned to the login page$/) do
  current_path.should eq(new_user_session_path)
end