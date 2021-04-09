class StaticImages
  BASE_S3 = '_static'

  class << self
    def icon
      s3_image('icon.svg')
    end

    def odyssey_cover
      s3_image('odyssey.jpg')
    end

    def huck_finn_cover
      s3_image('adventures-of-huckleberry-finn-full.jpg')
    end

    def pride_and_prejudice_cover
      s3_image('pride-and-prejudice-full.jpg')
    end

    def gatsby_cover
      s3_image('the-great-gatsby-full.jpg')
    end

    private

    def s3_image(key)
      Aws::S3::Object
        .new(
          bucket_name: AWS_S3_BUCKET_NAME,
          key: "#{StaticImages::BASE_S3}/#{key}"
        )
        .presigned_url(:get, expires_in: 3600)
    end
  end
end
