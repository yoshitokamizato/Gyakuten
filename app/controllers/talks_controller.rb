class TalksController < ApplicationController
  before_action :move_to_index
  before_action :get_page

  def index
    @level = Movie.count_level(@page)
    @salons = Movie.disp_talks(@page)
  end

  private

  def move_to_index
    flash[:error] = "ログインしてください" unless user_signed_in?
  end

  def get_page
    @page = params[:page]
  end

end