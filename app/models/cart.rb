class Cart < ActiveRecord::Base
	has_one :order
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

  def total_with_delivery
    total + delivery_cost
  end

  def new_item(option = {})
    current_item = cart_items.find_by(product_variant_id: option[:product_variant].id)
    if !current_item
      current_item = option[:product_variant].cart_items.build(option[:params])
    else
      option[:params][:quantity].empty? ? current_item.quantity = nil : current_item.quantity += option[:params][:quantity].to_i
    end
    current_item
  end
  
  def remove_product_variant
    cart_items.each do |item|
      item.quantity.times do
      ProductVariant.find_by(size_id: item.product_variant.size_id, 
                             color_id: item.product_variant.color_id, 
                             product_id: item.product_variant.product_id).destroy
      end
      product = Product.find(item.product_variant.product_id)
      if product.product_variants.blank?
        Product.find(product.id).destroy
      end
    end
  end
end
