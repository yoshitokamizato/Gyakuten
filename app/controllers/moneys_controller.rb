class MoneysController < ApplicationController
  def index
    @level = Movie.count_level(params[:page])
    @moneys = Movie.disp_money(params[:page])
  end
end
