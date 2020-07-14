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

  factory :stripe_customer_subscription do

  end

  factory :book do
    name { 'Pride and Prejudice' }
    author { 'Jane Austen' }
    cover_image_thumb_s3_key { 'images/pandpsmall.jpeg' }
    cover_image_full_s3_key { 'images/pandpfull.jpeg' }
  end

  factory :user do
    name { 'Danny' }
    sequence(:email) { |n| "#{n}em@i.l" }
    encrypted_password { 'password' }
    stripe_customer_id { 'cus_abc_123'}
    has_full_access { true }
  end
end
