class Article < ApplicationRecord
  belongs_to :category
  validates :title, presence: true,
                    uniqueness: true,
                    length: {maximum: 100}
  validates :content, presence: true, uniqueness: true
  validates :category_id, presence: true
  is_impressionable counter_cache: true

end
