class VideoedittingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_page

  def index
    @modvieedittings = Movie.disp_modvieedittings(@page)
  end

  private

    def get_page
      @page = params[:page]
    end

end
