class SalonsController < ApplicationController

  def index
    @level = Movie.count_level(params[:page])
    @salons = Movie.disp_salon(params[:page])
  end
end
