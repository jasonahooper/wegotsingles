require 'machinist/active_record'

Ethnicity.blueprint {}

User.blueprint do
  first_name { "John" }
  email { "john.smith@email.com" }
  password { 'password' }
  confirmed_at { Time.now }
end

Profile.blueprint do
  height { 191 }
end

Profile.blueprint(:imperial) do

end
