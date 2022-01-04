FactoryBot.define do
  factory :group do
    name { Faker::Team.name }
    content { Faker::Lorem.sentence }
  end
end
