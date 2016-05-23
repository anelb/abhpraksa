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

  def new_item(option = {})
    current_item = cart_items.find_by(product_variant_id: option[:product_variant].id)

    if !current_item
      current_item = option[:product_variant].cart_items.build(option[:params])
    else
      option[:params][:quantity].empty? ? current_item.quantity = nil : current_item.quantity += option[:params][:quantity].to_i
      #byebug
    end
    current_item
  end
  
end
