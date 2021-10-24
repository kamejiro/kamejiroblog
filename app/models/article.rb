class Article < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: {maximum: 100}
  validates :content, presence: true, uniqueness: true
  is_impressionable counter_cache: true

  def feed
    this.where("article_id=?",id)
  end
end
