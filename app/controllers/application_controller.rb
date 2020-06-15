class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :approval_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:slack_id]
  end

  def approval_user!
    unless current_user.flag
      redirect_to root_path, alert: "承認作業中です。しばらくお待ち下さい。"
    end
  end
end
