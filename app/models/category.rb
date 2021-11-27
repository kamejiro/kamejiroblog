class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :category,  presence: true,
                        uniqueness: true,
                        length: {maximum: 20}
end
