require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet.email }
  password { 'password' }
end

Profile.blueprint do

end

Profile.blueprint(:imperial) do
  imperial { true }
end