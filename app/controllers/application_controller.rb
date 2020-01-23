class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!,:configure_permitted_parameters,if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys: [:name,:sirname,:username,:gender,:email,:birthday,:profile_image,:password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:remeber_me])
  end
end
