class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sign_out_user, if: :user_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:slack_id]
  end

  def sign_out_user
    unless current_user.flag
      flash.clear
      flash.now[:alert] = "現在参加中のサロンのSlack IDで新規登録をお願いいたします。"
      sign_out(current_user)
    end
  end
end
