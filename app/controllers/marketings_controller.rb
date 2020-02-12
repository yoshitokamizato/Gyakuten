class MarketingsController < ApplicationController
  before_action :move_to_index

  def index
    page = params[:page]
    @level = Marketing.count_level(page)
    @marketings = Marketing.search_all_movie(page)
  end

  private

    def move_to_index
      flash[:error] = "ログインしてください" unless user_signed_in?
    end
end
