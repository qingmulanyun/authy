FactoryGirl.define do
  factory :user do
    first_name           { FFaker::Name.first_name }
    last_name            { FFaker::Name.last_name }
    email                { "#{FFaker::Name.first_name}-#{rand(1..1000)}@gmail.com" }
    password             { "password" }
    role                 { 'user' }
    phone                { FFaker::PhoneNumberAU.mobile_phone_number }
    country_code         { FFaker::PhoneNumberAU.country_code }
    authy_id             { '123456787' }
  end
end
