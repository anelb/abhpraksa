class Api::Exceptions::EmptyCart < Api::Exceptions::AbhShopException
  def code
    400
  end

  def messages
    ["Your cart is empty"]
  end
end