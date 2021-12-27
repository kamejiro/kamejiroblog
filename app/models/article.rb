class Article < ApplicationRecord
  belongs_to :category
  validates :title, presence: true,
                    uniqueness: true,
                    length: {maximum: 100}
  validates :abstract, presence: true
  validates :category_id, presence: true
  validates :content, presence: true, uniqueness: true

  def increment_impression
    self.impressions_count += 1
  end

end
