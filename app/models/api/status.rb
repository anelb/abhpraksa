class Api::Status 

  attr_accessor :code
  attr_accessor :messages

  def initialize(options = {})
    self.code = options[:code]
    self.messages = options[:message]
  end

  
  def self.ok 
    return Api::Status.new(code: 200, message: 'OK')
  end

  def self.from_exception(_e)
    return Api::Status.new(code: 500, message: 'Unknown error')
  end

  def self.from_abh_exception(e)
    return Api::Status.new(code: e.code, message: e.messages)
  end
end