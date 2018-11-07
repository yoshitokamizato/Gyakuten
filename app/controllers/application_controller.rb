class ApplicationController < ActionController::Base
  before_action :move_to_index, except: :index

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end

end
