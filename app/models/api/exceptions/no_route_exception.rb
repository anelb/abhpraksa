class Api::Exceptions::NoRouteException < Api::Exceptions::AbhShopException
  def code
    404
  end

  def messages
    ['Unexisting route']
  end
end