class Api::Exceptions::ValidationException < Api::Exceptions::AbhShopException
  def initialize(errors)
    @messages = errors
  end

  def code
    500
  end

  attr_reader :messages
end
