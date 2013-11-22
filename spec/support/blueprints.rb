require 'machinist/active_record'

Ethnicity.blueprint do

end

Language.blueprint do

end

User.blueprint do
  first_name { "John" }
  email { Faker::Internet.email }
  password { 'password' }
  confirmed_at { Time.now }
end

User.blueprint(:different_user) do
  first_name { "Sally" }
  email { "sally@email.com" }
  password { 'password' }
  confirmed_at { Time.now }
end

User.blueprint(:with_stripe) do
  stripe_customer_id { 'cus_2yc1BvwsPNa1Dn' }
  type { 'Man' }
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

Image.blueprint do

end

Image.blueprint(:with_file) do
  image { File.open('spec/fixtures/gary.jpg') }
end

PaymentOption.blueprint do
  amount { 1000 }
  interval { "month" }
  name { "Premium Monthly" }
  currency { 'GBP' }
  code { "premium-monthly" }
end

Message.blueprint do
  
end

Message.blueprint(:from_man) do
  subject { "I'm a man!" }
  body { "Cars!" }
end

Message.blueprint(:from_woman) do
  subject { "I'm a woman!" } 
  body { "Horses!" }
end

Man.blueprint do
end

Woman.blueprint do
end


