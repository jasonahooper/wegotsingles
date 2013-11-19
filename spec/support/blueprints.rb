require 'machinist/active_record'

Ethnicity.blueprint {}

User.blueprint do
  first_name { "John" }
  email { "john.smith@email.com" }
  password { 'password' }
  profile
end

Profile.blueprint do

end

Profile.blueprint(:imperial) do

end
