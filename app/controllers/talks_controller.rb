class TalksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_page

  def index
    @level = Movie.count_level(@page)
    @talks = Movie.disp_talks(@page)
  end

  private

    def get_page
      @page = params[:page]
    end
end
