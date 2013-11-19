require 'machinist/active_record'

User.blueprint do 
  first_name { "John" }
  email { "john.smith@email.com" }
  password { 'password' }
end