# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    # 以下を追加
    resource.flag = true if SlackMember.find_by(userid: resource.slack_id)
    # 以上を追加
    resource.save
    yield resource if block_given?
    if resource.persisted?
      # 以下を追加
      if resource.flag
        set_flash_message! :notice, :signed_up
      else
        flash[:alert] = "新規登録が完了しました。承認作業が完了するまで，しばらくお待ち下さい。"
        webhook_url = Rails.application.credentials.dig(:slack, :webhook_url, :gyakuten_approval_pending)
        notifier_msg = "承認待ちの方が追加されました。slack_id は #{resource.slack_id}"
        notifier = Slack::Notifier.new webhook_url
        notifier.ping notifier_msg
      end
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
      # 以上を追加

      # 元のコード
      # if resource.active_for_authentication?
      #   set_flash_message! :notice, :signed_up
      #   sign_up(resource_name, resource)
      #   respond_with resource, location: after_sign_up_path_for(resource)
      # else
      #   set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      #   expire_data_after_sign_in!
      #   respond_with resource, location: after_inactive_sign_up_path_for(resource)
      # end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
