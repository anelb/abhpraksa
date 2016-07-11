class ApiController < ActionController::Base

  # Check API authentication token 
  def restrict_api_access
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(api_token: token)
    end
  end

  def current_user
    @current_user
  end

  # Renderer
  ActionController::Renderers.add :response do |obj, options|
    render json: Api::Response.new(document: obj)
  end

  # Error handling
  rescue_from StandardError do |error|    
    render json: Api::Response.new(status: Api::Status.from_exception(error))
  end


  # No End Point
  def no_endpoint
    raise Api::Status.routing_error
  end
end