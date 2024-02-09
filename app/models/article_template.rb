class ArticleTemplate < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: {maximum: 100}
  validates :abstract, presence: true
  validates :content, presence: true, uniqueness: true

end
