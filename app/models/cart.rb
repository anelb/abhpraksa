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
    #byebug
  end

  def add_user_id(current_user)
    self.update_attribute(:user_id, current_user.id)
  end
  
  def remove_product_variant
    cart_items.each do |item|
      product_variant = ProductVariant.find(item.product_variant_id)
      new_quantity = product_variant.quantity - item.quantity
      product_variant.update_attribute(:quantity, new_quantity)
      product_variant.destroy if product_variant.quantity == 0 
    end
  end

end
