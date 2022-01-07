FactoryBot.define do
  factory :user_post, class: 'Post' do
    title { Faker::Lorem.sentence }
    status_id {1}
    contributor_type { 'User'}
    association :contributor, factory: :user
  end

  factory :group_post, class: 'Post' do
    title { Faker::Lorem.sentence}
    status_id {1}
    contributor_type { 'Group'}
    association :contributor, factory: :group
  end
end
