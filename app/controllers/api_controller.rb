class ApiController < ActionController::Base

  # Check API authentication token 
  def restrict_api_access
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(api_token: token)
    end
  end

  attr_reader :current_user

  # Renderer
  ActionController::Renderers.add :response do |obj, _options|
    render json: Api::Response.new(document: obj)
  end

  # Error handling
  rescue_from StandardError do |error|
    if error.is_a?(Api::Exceptions::AbhShopException)
      render json: Api::Response.new(status: Api::Status.from_abh_exception(error)), status: error.code
    else
      render json: Api::Response.new(status: Api::Status.from_exception(error)), status: 500
    end
  end


  # No End Point
  def no_endpoint
    raise Api::Exceptions::NoRouteException
  end
end