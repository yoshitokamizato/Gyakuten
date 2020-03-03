class AwsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @aws = Aw.order("id ASC")
  end

  def show
    @aws = Aw.find(params[:id])
  end

  private

    def move_to_index
      redirect_to action: :index, flash: { error: "ログインしてください" } unless user_signed_in?
    end
end
