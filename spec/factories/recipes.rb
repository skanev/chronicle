FactoryBot.define do
  factory :recipe do
    association :user
    name { 'Recipe name' }
    instructions { 'Instructions' }
  end
end
