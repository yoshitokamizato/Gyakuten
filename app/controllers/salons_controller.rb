class SalonsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_page

  def index
    @level = Movie.count_level(@page)
    @salons = Movie.disp_salon(@page)
  end

  private

    def get_page
      @page = params[:page]
    end

end
