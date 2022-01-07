FactoryBot.define do
  factory :page do
    content { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence}
    page { Faker::Number.digit}
  end
end
