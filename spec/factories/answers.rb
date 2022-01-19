FactoryBot.define do
  factory :answer do
    question { Faker::Lorem.sentence }
    answer { Faker::Lorem.sentence }
  end
end
