class SalonsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @level = params[:page] ? (params[:page].to_i * 10) : 1
    @salons = Movie.where(genre: "Salon").page(params[:page]).per(10)
  end

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end
end