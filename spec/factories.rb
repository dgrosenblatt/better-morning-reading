FactoryBot.define do
  factory :scheduled_chapter_email do
    chapter
    subscription
    sent_at { 1.day.ago }
  end

  factory :subscription do
    user
    book
    status { 'active' }
    sunday { true }
    monday { true }
    tuesday { true }
    wednesday { true }
    thursday { true }
    friday { true }
    saturday { true }
  end

  factory :chapter do
    book
  end

  factory :book do
    name { 'Pride and Prejudice' }
    author { 'Jane Austen' }
    cover_image_thumb_s3_key { 'images/pandpsmall.jpeg' }
    cover_image_full_s3_key { 'images/pandpfull.jpeg' }
    amazon_link { 'http://example.com/pride-and-prejudice' }
  end

  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
    password { 'password' }
    encrypted_password { '23r9fn3o2rno' }
    stripe_customer_id { 'cus_abc_123'}

    trait :with_full_access do
      stripe_subscription_data { { 'status' => 'active', 'current_period_end' => 2.days.from_now.to_i } }
    end
  end
end
