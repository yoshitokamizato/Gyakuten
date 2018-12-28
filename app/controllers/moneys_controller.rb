class MoneysController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :get_page, only: :index

  def index
    @level = Movie.count_level(@page)
    @moneys = Movie.disp_money(@page)
  end

  private

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end

  def get_page
    @page = params[:page]
  end

end