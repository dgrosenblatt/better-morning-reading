FactoryBot.define do
  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
  end
end
