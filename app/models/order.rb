class Order < ActiveRecord::Base
  belongs_to :cart

  def user_full_name
    user.full_name
  end

  def user_email_address
    user.email
  end

  def cart_items
    self.cart.cart_items
  end

  def total_price
    self.cart.total
  end

  def delivery_cost
    self.cart.delivery_cost
  end

  def to_pay_with_delivery
    self.cart.total_with_delivery
  end

  
  private

  def user
    User.find(self.cart.user_id)
  end

end
