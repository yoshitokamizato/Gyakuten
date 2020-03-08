class MoneysController < ApplicationController
  before_action :authenticate_user!

  def index
    @level = Movie.count_level(params[:page])
    @moneys = Movie.disp_money(params[:page])
  end
end
