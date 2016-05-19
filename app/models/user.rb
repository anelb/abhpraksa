class User < ActiveRecord::Base

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}
  
  validates :password, length: {minimum: 6}

  has_one :cart
  has_secure_password

end
