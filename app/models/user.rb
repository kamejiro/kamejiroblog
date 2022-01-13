class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  EMAIL_VALID=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: {with: EMAIL_VALID},
                    length: {maximum: 255}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def User.digest(string)
    cost=ActiveModel::SecurePassword.min_cost ?
    BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
