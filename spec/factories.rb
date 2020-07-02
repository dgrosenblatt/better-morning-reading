FactoryBot.define do
  factory :book do
    
  end

  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
  end
end
