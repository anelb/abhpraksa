class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  has_one :cart
  has_secure_password
end
