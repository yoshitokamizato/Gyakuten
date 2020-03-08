class MarketingsController < ApplicationController
  before_action :authenticate_user!

  def index
    page = params[:page]
    @level = Marketing.count_level(page)
    @marketings = Marketing.search_all_movie(page)
  end
end
