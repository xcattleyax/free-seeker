class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  gon.current_user_id = current_user.id
  gon.l_message_created_at = l message.created_at

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
