FactoryBot.define do
  factory :stripe_customer_subscription do
    
  end

  factory :book do
    
  end

  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
  end
end
