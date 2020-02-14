class MoneysController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @level = Movie.count_level(params[:page])
    @moneys = Movie.disp_money(params[:page])
  end

  private

    def move_to_index
      redirect_to action: :index, flash: { error: "ログインしてください" } unless user_signed_in?
    end
end
