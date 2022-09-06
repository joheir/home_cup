class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_chat

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    profiles_path
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def set_chat
    @chats = Chat.where(receiver: @profile)
  end
end
