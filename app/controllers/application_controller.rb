class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing, with: :invalid_param

  def route_not_found
    render json: '404 Not Found', status: :not_found
  end

  def invalid_param
    render json: '400 Bad Request due to Missing Parameter', status: :bad_request
  end
end
