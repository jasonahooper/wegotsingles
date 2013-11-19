require 'machinist/active_record'

Ethnicity.blueprint do

end

Language.blueprint do

end

User.blueprint do
  first_name { "John" }
  email { "john.smith@email.com" }
  password { 'password' }
  confirmed_at { Time.now }
end

Profile.blueprint do

end
