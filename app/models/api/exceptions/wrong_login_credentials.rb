class Api::Exceptions::WrongLoginCredentials < Api::Exceptions::AbhShopException
  def code
    401
  end

  def messages
    ['Invalid email/password combination']
  end
end