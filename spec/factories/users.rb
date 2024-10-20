FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "user-#{n}@example.com" }
    password { 'password' }
  end
end
