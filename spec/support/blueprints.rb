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
  height { 191 }
end

Profile.blueprint(:without_height) do
  height { nil }
end

Profile.blueprint(:without_weight) do
  height { nil }
end


Profile.blueprint(:imperial) do

end

PaymentOption.blueprint do
  amount { 1000 }
  interval { "month" }
  name { "Premium Monthly" }
  currency { 'GBP' }
  code { "premium-monthly" }
end
