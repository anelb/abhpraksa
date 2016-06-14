class User < ActiveRecord::Base

  attr_accessor :remember_token, :reset_token 

  validates :first_name, :last_name, :email, :username,  presence: true
  validates :email, :username, uniqueness: true
  validates :first_name, :last_name, length: {maximum: 50}
  validates_format_of :first_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :last_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :username, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }
  
  validates :password, length: {minimum: 6}

  has_one :cart
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
  end

end
