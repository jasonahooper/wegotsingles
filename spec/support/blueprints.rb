require 'machinist/active_record'

Woman.blueprint do
  first_name { Faker::Name.first_name }
  email { Faker::Internet.email }
  profile { Profile.make! }
end


Woman.blueprint(:miss_right) do
  first_name { "Miss Right" }
  email { Faker::Internet.email }
  profile { Profile.make!(:miss_right) }
end

Man.blueprint(:mr_right) do
  first_name { "Mr Right" }
  email { Faker::Internet.email }
  password { "password" }
  profile { Profile.make!(:mr_right) }
  confirmed_at { Time.now }
end

Profile.blueprint(:mr_right) do
  looking_for { "A Woman that likes football and horses"}
end

Profile.blueprint(:miss_right) do
  about_you { "I like horses and football" }
end

Man.blueprint do
  email { Faker::Internet.email }
end

Ethnicity.blueprint do

end

Profile.blueprint do
  height { 191 }
end

Language.blueprint do

end

User.blueprint do
  first_name { "John" }
  email { "john.smith@email.com" }
  password { 'password' }
  confirmed_at { Time.now }
  lat { 51 }
  # lat { 51 * Math::PI / 180 }
  lng { 0 }
  # lng { 0 * Math::PI / 180 }
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
  subject { }
  body {  }
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
