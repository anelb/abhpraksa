class User < ActiveRecord::Base

  validates :first_name, :last_name, :email, presence: true
  valldates :email, uniqueness: true
  
  has_one :cart
  has_secure_password

  def self.find_without_ordering
  	unscoped.all
  end
end
