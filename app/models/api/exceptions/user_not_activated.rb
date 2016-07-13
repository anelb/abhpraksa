class Api::Exceptions::UserNotActivated < Api::Exceptions::AbhShopException
  def code
    500
  end

  def messages
    ["Account is not activated. Check your email for the activation link."]
  end
end