class Api::Exceptions::WrongLoginCredentials < Api::Exceptions::AbhShopException
  def code
    500
  end

  def messages
    ['Invalid email/password combination']
  end
end