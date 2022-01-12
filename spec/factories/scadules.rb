FactoryBot.define do
  factory :scadule do
    date { Faker::Date.between(from: '2021-01-01', to:'2022-12-31')}
    content { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    association :group
  end
end
