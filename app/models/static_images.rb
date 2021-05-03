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

    def cool_background
      s3_image('cool-background.png')
    end

    def sun_background
      s3_image('sun-background.png')
    end

    def ocean_background
      s3_image('ocean-background.png')
    end

    def kale_background
      s3_image('kale-background.png')
    end

    def gooey_background
      s3_image('gooey-background.png')
    end

    def gooey_background_small
      s3_image('gooey-background-small.png')
    end

    def fresh_background
      s3_image('fresh-background.jpeg')
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
