class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  validates :title, presence: true,
                    uniqueness: true,
                    length: {maximum: 100}
  validates :abstract, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, uniqueness: true
  validates :image,
  content_type: {
    in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format"
  },
  size: {
    less_than: 5.megabytes,
    message: "should be less than 5MB"
  }

  enum private_status: {
    public: 0, 
    private: 1
  }, _prefix: true

  def increment_impression
    self.impressions_count += 1
  end

  def self.search(keyword)
    Article.where(["title LIKE?", "%#{keyword}%"])
  end

    #リサイズ済み画像を返す
  def resize_feed_image
    image.variant(resize_to_limit: [150, 150])
  end

end
