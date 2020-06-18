class AutoSlackApproval
  def initialize(salon_name:, slack_id:)
    @salon_name = salon_name
    @slack_id = slack_id
  end

  def approval?
    client = Slack::Web::Client.new(token: Rails.application.credentials.dig(:slack, :oauth_token, @salon_name))
    user = client.users_info(user: @slack_id).user
    !user.deleted && !user.is_bot
  rescue Slack::Web::Api::Errors::UserNotFound
    false
  end
end
