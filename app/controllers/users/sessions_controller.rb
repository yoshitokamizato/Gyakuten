# frozen_string_literal: true
SALON_NAMES = [:gyakuten, :yanbaru_expert, :yanbaru_code, :php].freeze

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    # Deviseのログイン維持期間はデフォルトの2週間で設定中
    # 前回のチェックから1週間以上経過している場合は，再度Slackに問い合わせ，
    # 削除済みアカウントになっている場合は承認を取り消す
    if resource.flag && Time.current > resource.approval_at + 7.days
      if resource.slack_name.present?
        client = AutoSlackApproval.new(slack_name: resource.slack_name.to_sym, slack_id: resource.slack_id)
        resource.flag = client.approval?
      else
        Rails.application.credentials.dig(:slack, :oauth_token).keys.each do |slack_name|
          client = AutoSlackApproval.new(slack_name: slack_name, slack_id: resource.slack_id)
          resource.flag = client.approval?
          if resource.flag
            resource.slack_name = slack_name.to_s
            break
          end
        end
      end
      resource.approval_at = Time.current
      resource.save!
    end
    # 以上を追加
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
