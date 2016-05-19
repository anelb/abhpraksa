class Cart < ActiveRecord::Base
	
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def total
  	price = []
  	cart_items.each do|item| 
  		price << ProductVariant.find(item.product_variant_id).product.price * item.quantity
  	end
  	return price.inject(:+)
  end

  def delivery_cost
  	how_many_orders * 5
  end

  def how_many_orders
  	orders = []
  	cart_items.each do|item| 
  		orders << item.quantity
  	end
  	return orders.inject(:+)
  end
end
