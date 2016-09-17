class Api::Exceptions::RecordNotFound < Api::Exceptions::AbhShopException
  def initialize(object)
    @object = object
  end

  def code
    404
  end

  def messages
    ["#{@object} not found"]
  end
end