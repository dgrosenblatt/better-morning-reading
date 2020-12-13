class Book < ApplicationRecord
  validates :author, presence: true
  validates :cover_image_thumb_s3_key, presence: true
  validates :cover_image_full_s3_key, presence: true
  validates :name, presence: true

  has_many :chapters

  def self.sample
    ids = all.pluck(:id)
    sample_ids = ids.sample(10)
    where(id: sample_ids)
  end

  def cover_image_thumb_url
    # 100 x 140
    Aws::S3::Object
      .new(bucket_name: AWS_S3_BUCKET_NAME, key: cover_image_thumb_s3_key)
      .presigned_url(:get, expires_in: 3600)
  end

  def cover_image_full_url
    Aws::S3::Object
      .new(bucket_name: AWS_S3_BUCKET_NAME, key: cover_image_full_s3_key)
      .presigned_url(:get, expires_in: 3600)
  end

  def amazon_url
    amazon_link || URI.encode("https://www.amazon.com/s?k=#{name}")
  end
end
