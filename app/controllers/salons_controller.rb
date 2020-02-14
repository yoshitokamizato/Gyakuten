class SalonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @level = Movie.count_level(params[:page])
    @salons = Movie.disp_salon(params[:page])
  end
end
