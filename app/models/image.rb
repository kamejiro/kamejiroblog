class Image < ApplicationRecord
  has_one_attached :image
  validates :image,
    content_type: {
      in: %w[image/jpeg image/gif image/png],
      message: "must be a valid image format"
    },
    size: {
      less_than: 5.megabytes,
      message: "should be less than 5MB"
    }

    #リサイズ済み画像を返す
  def resize_feed_image
    image.variant(resize_to_limit: [100, 100])
  end

  def resize_index_image
    image.variant(resize_to_limit: [200, 200])
  end

  def resize_article_image
    image.variant(resize_to_limit: [500, 500])
  end

  def authenticated_image_url(style)
    file_url.s3_object(style).url_for(:read, :secure => true)
  end
end


