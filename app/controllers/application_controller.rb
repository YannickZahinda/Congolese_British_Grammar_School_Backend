class ApplicationController < ActionController::API
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception| 
    render json: { warning: exception, status: 'authorization_failed' }
  end
end
