FactoryBot.define do
  factory :scheduled_chapter_email do
    
  end

  factory :subscription do
    
  end

  factory :chapter do
    
  end

  factory :stripe_customer_subscription do
    
  end

  factory :book do
    
  end

  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
  end
end
