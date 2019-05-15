class SalonsController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :get_page, only: :index

  def index
    @level = Movie.count_level(@page)
    @salons = Movie.disp_salon(@page)
  end

  private

  def move_to_index
    flash[:error] = "ログインしてください" unless user_signed_in?
  end

  def get_page
    @page = params[:page]
  end

end