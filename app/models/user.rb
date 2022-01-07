class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  EMAIL_VALID=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: {with: EMAIL_VALID},
                    length: {maximum: 255}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
