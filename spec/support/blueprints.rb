require 'machinist/active_record'

Woman.blueprint do
  email { Faker::Internet.email }
  profile { Profile.make! } 
end

Profile.blueprint do
  height { 191 }
  about_you { Faker::Lorem.words(num =  50).join(' ') }
end

Woman.blueprint(:miss_right) do
  email { Faker::Internet.email }
  profile { Profile.make!(:miss_right) }
end

Man.blueprint(:mr_right) do
  email { Faker::Internet.email }
  password { "password" }
  profile { Profile.make!(:mr_right) }
  confirmed_at { Time.now }
end

Profile.blueprint(:mr_right) do
  about_you { "I like horses and football and" }
end

Profile.blueprint(:miss_right) do
  about_you { "horses, football" }
end

Man.blueprint do
  email { Faker::Internet.email }
end

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
