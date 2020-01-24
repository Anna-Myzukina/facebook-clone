class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters,if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys: [:username,:sirname,:gender,:email,:birthday,:profile_image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:remeber_me])
  end
end
