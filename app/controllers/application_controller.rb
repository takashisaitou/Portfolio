class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!


  include ApplicationHelper

  def after_sign_in_path_for(resource)
    # users_path
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:department])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:department])
    end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end


end
