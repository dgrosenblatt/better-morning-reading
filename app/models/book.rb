class Book < ApplicationRecord
  validates :author, presence: true
  validates :cover_image_thumb_s3_key, presence: true
  validates :cover_image_full_s3_key, presence: true
  validates :name, presence: true

  def cover_image_thumb_url
    Aws::S3::Object
      .new(bucket_name: AWS_S3_BUCKET_NAME, key: cover_image_thumb_s3_key)
      .presigned_url(:get, expires_in: 3600)
  end

  def cover_image_full_url
    Aws::S3::Object
      .new(bucket_name: AWS_S3_BUCKET_NAME, key: cover_image_full_s3_key)
      .presigned_url(:get, expires_in: 3600)
  end
end
