class MarketingsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    page = params[:page]
    @level = Marketing.count_level(page)
    @marketings = Marketing.search_all_movie(page)
  end

end
