class Api::Exceptions::NoEmailField < Api::Exceptions::AbhShopException
  def code
    500
  end

  def messages
    ["Email address doesn't exist"]
  end
end