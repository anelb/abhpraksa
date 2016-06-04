class Brand < ActiveRecord::Base
  has_many :products
  validates :title, presence: true
  validates_associated :products
end
