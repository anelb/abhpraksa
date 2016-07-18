class Api::Exceptions::UnauthorizedAccess < Api::Exceptions::AbhShopException
  def code
    401
  end

  def messages
    ['Unauthorized access']
  end
end