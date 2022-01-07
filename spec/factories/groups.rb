FactoryBot.define do
  factory :group, class: 'Group' do
    name { Faker::Team.name }
    content { Faker::Lorem.sentence }
  end
end
