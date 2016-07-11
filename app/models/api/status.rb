class Api::Status < StandardError 

  attr_accessor :code
  attr_accessor :message

  def initialize(options = {})
    self.code    = options[:code]
    self.message = options[:message]
  end

  def self.from_exception(exception)
    return exception.instance_of?(Api::Status) ? exception : general_error(exception)
  end

  # Factory
  def self.ok 
    return Api::Status.new(code: 200, message: 'OK')
  end

  def self.general_error(msg)
    return Api::Status.new(code: 500, message: 'Anything else')
  end

  def self.routing_error
    return Api::Status.new(code: 404, message: 'Not found' )
  end
end